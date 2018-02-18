/************************************************************************/
/*																		*/
/*	System.c This implements system dependent code                      */
/*																		*/
/************************************************************************/
/*  Author:     Keith Vogel                                             */
/*  Copyright 2013, Digilent Inc.                                       */
/************************************************************************/
/* deIP core network library
*
* Copyright (c) 2013-2014, Digilent <www.digilentinc.com>
* Contact Digilent for the latest version.
*
* This program is free software; distributed under the terms of 
* BSD 3-clause license ("Revised BSD License", "New BSD License", or "Modified BSD License")
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*
* 1.    Redistributions of source code must retain the above copyright notice, this
*        list of conditions and the following disclaimer.
* 2.    Redistributions in binary form must reproduce the above copyright notice,
*        this list of conditions and the following disclaimer in the documentation
*        and/or other materials provided with the distribution.
* 3.    Neither the name(s) of the above-listed copyright holder(s) nor the names
*        of its contributors may be used to endorse or promote products derived
*        from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
* LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
* OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/************************************************************************/
/*  Module Description: 												*/
/*																		*/
/*	System dependent code, this module needs to be defined              */
/*	for each processor and/or board                                     */
/*																		*/
/************************************************************************/
/*  Revision History:													*/
/*																		*/
/*	8/15/2012(KeithV): Created											*/
/*																		*/
/************************************************************************/

#include "deIP.h"
#include "xil_exception.h"

u32 WF_GPIO_BASEADDRESS;
u32 WF_SPI_BASEADDRESS;
u32 WF_CS_BASEADDRESS;
u32 WF_TIMER_BASEADDRESS;
u32 WF_E_INT_VECTOR;

/*********************************************************************
 * Function:        void ExEndian(void * pv, int cb)
 *
 * Input:           pv  A pointer to the start of the buffer
 *                      to switch Endian order on
 *                  cb  The number of bytes in the buffer 
 *                  
 * Output:          None
 * 
 * Returns:         None
 * 
 * Note:            Typically we do uint16_t and uint32_t
 *                  This could be split into 2 asm routines for efficiency
 ********************************************************************/
void ExEndian(void * pv, int cb)
{
    uint8_t * pb = (u8*)pv;
    int  i, j;

    for(i=0, j=cb-1; i<j; i++, j--)
    {
        uint8_t bT = pb[j];

        pb[j] = pb[i];
        pb[i] = bT;
     }
}
/*********************************************************************
 * Function:        uint16_t CalculateChecksum(void * pv, unsigned int cb)
 *
 * Input:           pv  A pointer to the start of the buffer
 *                      to calculate the checksum on.
 *                  cb  The number of bytes in the buffer 
 *                  
 * Output:          None
 * 
 * Returns:         The RFC 1071 calculated checksum
 * 
 * Note:            This follows RFC 1071. To understand why
 *                  it does what it does, read RFC 1071
 *              
 *                  In general, Endian is not a concern, but
 *                  because some of the our data structures
 *                  machine order have bit fields and bytes 
 *                  that are in network order even when in 
 *                  machine order, we must always calculate
 *                  the checksum when the buffers are in network order.
 *                  The result of the checksum will be in network order.    
 *                  
 *                  The code has been designed, when switching to
 *                  network order, the checksum is calculated.
 *                  But when switching to machine order the checksum
 *                  is validated and a properly validated checksum
 *                  will have a value of zero. If when in machine order and
 *                  the checksum is not zero, the checksum did not validate
 *                  and an error was detected.
 *
 *                  Another important factor is that the network headers are
 *                  all at least modulo 2 if not modulo 4, so the only
 *                  data that might be have an odd number of bytes is the payload
 *                  We must append a zero at the end of this last byte.
 *
 *                  Unfortuately when calculating a checksum, the payload may
 *                  On an unaligned boundaries and we will get misaligned
 *                  derefernece fault, so we must deal with this as well.
 *                  In particular, payloads pointing into a socket is a problem
 * 
 *                  So under a non-error condition, machine order
 *                  structures will have a checksum of zero, and
 *                  network order structures will have the checksum
 * 
 ********************************************************************/
static inline uint16_t __attribute__((always_inline)) unalignedload(volatile void *ptr)
 {
    struct unaligned {
      uint16_t u16;
    } __attribute__ ((packed)) *ip;
    ip = (struct unaligned *)ptr;

    return ip->u16;
 }

uint16_t CalculateChecksum(uint16_t sumComplement, void * pv, unsigned int cb)
{
    uint8_t *       pbEnd   = (u8*)pv + cb;
    uint32_t        sum     = ((uint32_t) (~sumComplement)) & 0x0000FFFF;

    if(cb > 0)
    {
        // make this as short and sweet so the compiler can do the best it can
//        for(; pv < (void *) (pbEnd-1); pv += sizeof(uint16_t)) sum += *((uint16_t *) pv);         // this faults on unaligned pv
//        for(; pv < (void *) (pbEnd-1); pv += sizeof(uint16_t)) sum += (uint32_t) (((uint16_t) *((uint8_t *) pv)) | (((uint16_t) *((uint8_t *) pv+1)) << 8));  // works but gens more code than below
        for(; pv < (void *) (pbEnd-1); pv += sizeof(uint16_t)) sum += unalignedload(pv);

        // see if we need to pad a zero at the end of the last odd byte; RFC 1071
        // no need to worry about unaligned pv as we deref as a byte only
        if(pv < (void *) pbEnd) sum += (((uint16_t) (*(pbEnd - 1))) & 0x00FF);

        // add the carry until all carries are added
        while((sum & 0xFFFF0000) != 0) sum = (sum & 0x0000FFFF) + (sum >> 16);
    }
    
    // return the ones complement
    return((uint16_t) ((~sum) & 0x0000FFFF));
}

u64 GetSysTick(){
#ifdef XPAR_PS7_CORTEXA9_0_CPU_CLK_FREQ_HZ
	XTime sysTime;
	XTime_GetTime(&sysTime);
#else
u64 sysTime=WF_TimerReadr();
#endif
	return sysTime;
}

// Because this can be running on one of many systems, and because we do not know what
// what kinds of clocks or the frequency or wrap time is available, it is difficult
// to pick an update time that works for all systems. With the MX7cK the system clock
// run at 80MHz/2 => 40MHz and wraps a uint32_t once every 107 seconds.
// So a minute might make sense, however some systems might not be able to provide up
// to a min. without wrapping. Also,if we don't get called enough, we want to have slack
// in the clock counter should we be called way late.
// we also don't want to do a lot of work or be called too often if this routine is implmented
// from an interrupt. Assuming all system counters can provide multiple seconds before a wrap
// lets up date our counters on a 1 second basis, that is slow enough to not flood an interrupt
// and fast enough that most systems won't wrap their system counter in that time.
uint32_t tSYSTicksLastSec = 0;
uint32_t tSYSSec = 0;
uint32_t SYSGetSecond(void)
{
    uint32_t tDelta = GetSysTick() - tSYSTicksLastSec;
    
    // see if we need to update the second counter
    if(tDelta >= SYSTICKSPERSEC)
    {
        tDelta = tDelta / SYSTICKSPERSEC;
        tSYSSec += tDelta;
        tSYSTicksLastSec += tDelta * SYSTICKSPERSEC;
    }

    return(tSYSSec);
}

uint32_t SYSGetMilliSecond(void)
{
    return(((GetSysTick() - tSYSTicksLastSec) / SYSTICKSPERMSEC) + (tSYSSec * 1000));
}

uint32_t SYSGetMicroSecond(void)
{
    return(((GetSysTick() - tSYSTicksLastSec) / SYSTICKSPERUSEC) + (tSYSSec * 1000000));
}

// RFC 1122 4.2.2.9 & RFC 793 3.3
// 4 usec sequence number clock.
uint32_t SYSGetSeqNumber(void)
{
    // don't do SYSGetMicroSecond() / 4 because the upper 2 bits will never get set
    // and we will wrap too early
    return(((GetSysTick() - tSYSTicksLastSec) / (SYSTICKSPERUSEC * 4)) + (tSYSSec * 250000));
}

void SYSPeriodicTasks(void)
{
    // update our time
    SYSGetSecond();
}

void setPmodWifiAddresses(u32 SPI_BASEADDRESS, u32 WFGPIO_BASEADDRESS, u32 WFCS_BASEADDRESS, u32 TIMER_BASEADDRESS){
	WF_GPIO_BASEADDRESS = WFGPIO_BASEADDRESS;
	WF_SPI_BASEADDRESS = SPI_BASEADDRESS;
	WF_CS_BASEADDRESS = WFCS_BASEADDRESS;
	WF_TIMER_BASEADDRESS = TIMER_BASEADDRESS;
}
void setPmodWifiIntVector(u32 VectorNumber){
	WF_E_INT_VECTOR= VectorNumber;
}


/* ------------------------------------------------------------ */
/*			Misc Processor Support Functions					*/
/* ------------------------------------------------------------ */
/***	getPeripheralClock()
**
**	Parameters:
**		none
**
**	Return Value:
**		Returns the current peripheral bus clock frequency
**
**	Errors:
**		none
**
**	Description:
**		Get the peripheral bus clock frequency
*/
uint32_t GetPeripheralClock()
{
    return GetSystemClock();
}

