/*-------------------------------------------------------------------------
 * Copyright (C) 1997	National Center for Supercomputing Applications.
 *                      All rights reserved.
 *
 *-------------------------------------------------------------------------
 *
 * Created:		H5MM.c
 * 			Jul 10 1997
 * 			Robb Matzke <robb@maya.nuance.com>
 *
 * Purpose:		Memory management functions.
 *
 * Modifications:	
 *
 *-------------------------------------------------------------------------
 */
#include <assert.h>
#include "hdf5.h"

#include "H5MMprivate.h"


/*-------------------------------------------------------------------------
 * Function:	H5MM_xmalloc
 *
 * Purpose:	Just like malloc(3) except it aborts on an error.
 *
 * Return:	Success:	Ptr to new memory.
 *
 *		Failure:	abort()
 *
 * Programmer:	Robb Matzke
 *		robb@maya.nuance.com
 *		Jul 10 1997
 *
 * Modifications:
 *
 *-------------------------------------------------------------------------
 */
void *
H5MM_xmalloc (size_t size)
{
   void *mem = HDmalloc (size);
   assert (mem);
   return mem;
}


/*-------------------------------------------------------------------------
 * Function:	H5MM_xcalloc
 *
 * Purpose:	Just like calloc(3) except it aborts on an error.
 *
 * Return:	Success:	Ptr to memory.
 *
 *		Failure:	abort()
 *
 * Programmer:	Robb Matzke
 *		robb@maya.nuance.com
 *		Jul 10 1997
 *
 * Modifications:
 *
 *-------------------------------------------------------------------------
 */
void *
H5MM_xcalloc (size_t n, size_t size)
{
   void *mem = HDcalloc (n, size);
   assert (mem);
   return mem;
}


/*-------------------------------------------------------------------------
 * Function:	H5MM_xrealloc
 *
 * Purpose:	Just like the POSIX version of realloc(3) exept it aborts
 *		on an error.  Specifically, the following calls are
 *		equivalent
 *
 * 		H5MM_xrealloc (NULL, size) <==> H5MM_xmalloc (size)
 *		H5MM_xrealloc (ptr, 0)     <==> H5MM_xfree (ptr)
 *		H5MM_xrealloc (NULL, 0)	   <==> NULL
 *
 * Return:	Success:	Ptr to new memory or NULL if the memory
 *				was freed.
 *
 *		Failure:	abort()
 *
 * Programmer:	Robb Matzke
 *		robb@maya.nuance.com
 *		Jul 10 1997
 *
 * Modifications:
 *
 *-------------------------------------------------------------------------
 */
void *
H5MM_xrealloc (void *mem, size_t size)
{
   if (!mem) {
      if (0==size) return NULL;
      mem = H5MM_xmalloc (size);
      
   } else if (0==size) {
      mem = H5MM_xfree (mem);

   } else {
      mem = realloc (mem, size);
      assert (mem);
   }

   return mem;
}


/*-------------------------------------------------------------------------
 * Function:	H5MM_strdup
 *
 * Purpose:	Duplicates a string.  If the string to be duplicated is the
 *		null pointer, then return null.  If the string to be duplicated
 *		is the empty string then return a new empty string.
 *
 * Return:	Success:	Ptr to a new string (or null if no string).
 *
 *		Failure:	abort()
 *
 * Programmer:	Robb Matzke
 *		robb@maya.nuance.com
 *		Jul 10 1997
 *
 * Modifications:
 *
 *-------------------------------------------------------------------------
 */
char *
H5MM_xstrdup (const char *s)
{
   char		*mem;

   if (!s) return NULL;
   mem = H5MM_xmalloc (strlen (s)+1);
   strcpy (mem, s);
   return mem;
}


/*-------------------------------------------------------------------------
 * Function:	H5MM_xfree
 *
 * Purpose:	Just like free(3) except null pointers are allowed as
 *		arguments, and the return value (always NULL) can be
 *		assigned to the pointer whose memory was just freed:
 *
 * 			thing = H5MM_xfree (thing);
 *
 * Return:	Success:	NULL
 *
 *		Failure:	never fails
 *
 * Programmer:	Robb Matzke
 *		robb@maya.nuance.com
 *		Jul 10 1997
 *
 * Modifications:
 *
 *-------------------------------------------------------------------------
 */
void *
H5MM_xfree (void *mem)
{
   if (mem) HDfree (mem);
   return NULL;
}
