/*
 * Copyright (C) 1997 National Center for Supercomputing Applications.
 *                    All rights reserved.
 *
 * Programmer: Robb Matzke <matzke@llnl.gov>
 *             Thursday, September 18, 1997
 *
 * Purpose:     This file contains declarations which are visible
 *              only within the H5G package. Source files outside the
 *              H5G package should include H5Gprivate.h instead.
 */
#ifndef H5G_PACKAGE
#error "Do not include this file outside the H5G package!"
#endif

#ifndef _H5Gpkg_H
#define _H5Gpkg_H

#include <H5ACprivate.h>
#include <H5Gprivate.h>

#define H5G_NODE_VERS   1               /*symbol table node version number   */
#define H5G_SIZE_HINT   1024            /*default root grp size hint         */
#define H5G_NODE_K(F) ((unsigned)((F)->shared->create_parms->sym_leaf_k))
#define H5G_NODE_SIZEOF_HDR(F) (H5G_NODE_SIZEOF_MAGIC + 4)

#define H5G_DEFAULT_ROOT_SIZE  32

/*
 * A symbol table node is a collection of symbol table entries.  It can
 * be thought of as the lowest level of the B-link tree that points to
 * a collection of symbol table entries that belong to a specific symbol
 * table or group.
 */
typedef struct H5G_node_t {
    hbool_t     dirty;                  /*has cache been modified?           */
    int         nsyms;                  /*number of symbols                  */
    H5G_entry_t *entry;                 /*array of symbol table entries      */
} H5G_node_t;

/*
 * Each key field of the B-link tree that points to symbol table
 * nodes consists of this structure...
 */
typedef struct H5G_node_key_t {
    size_t      offset;                 /*offset into heap for name          */
} H5G_node_key_t;

/*
 * A group handle passed around through layers of the library within and
 * above the H5G layer.
 */
struct H5G_t {
    int         nref;                   /*open reference count               */
    H5G_entry_t ent;                    /*info about the group               */
};

/*
 * Each file has a stack of open groups with the latest entry on the
 * stack the current working group.  If the stack is empty then the
 * current working group is the root object.
 */
typedef struct H5G_cwgstk_t {
    H5G_t               *grp;           /*a handle to an open group          */
    struct H5G_cwgstk_t *next;          /*next item (earlier) on stack       */
} H5G_cwgstk_t;

/*
 * These operations can be passed down from the H5G_stab layer to the
 * H5G_node layer through the B-tree layer.
 */
typedef enum H5G_oper_t {
    H5G_OPER_FIND        = 0,   /*find a symbol                              */
    H5G_OPER_INSERT      = 1    /*insert a new symbol                        */
} H5G_oper_t;

/*
 * Data exchange structure for symbol table nodes.  This structure is
 * passed through the B-link tree layer to the methods for the objects
 * to which the B-link tree points.
 */
typedef struct H5G_bt_ud1_t {

    /* downward */
    H5G_oper_t  operation;              /*what operation to perform          */
    const char  *name;                  /*points to temporary memory         */
    haddr_t     heap_addr;              /*symbol table heap address          */

    /* downward for INSERT, upward for FIND */
    H5G_entry_t ent;                    /*entry to insert into table         */

} H5G_bt_ud1_t;

/*
 * Data exchange structure to pass through the B-tree layer for the
 * H5B_iterate function.
 */
typedef struct H5G_bt_ud2_t {
    /* downward */
    hid_t	group_id;	/*group id to pass to iteration operator     */
    struct H5G_t *group;	/*the group to which group_id points	     */
    int		skip;		/*initial entries to skip		     */
    H5G_iterate_t op;		/*iteration operator			     */
    void	*op_data;	/*user-defined operator data		     */

    /* upward */
    
} H5G_bt_ud2_t;

/*
 * This is the class identifier to give to the B-tree functions.
 */
extern H5B_class_t H5B_SNODE[1];

/* The cache subclass */
extern const H5AC_class_t H5AC_SNODE[1];

/*
 * Functions that understand symbol tables but not names.  The
 * functions that understand names are exported to the rest of
 * the library and appear in H5Gprivate.h.
 */
herr_t H5G_stab_create (H5F_t *f, size_t size_hint, H5G_entry_t *ent/*out*/);
herr_t H5G_stab_find (H5G_entry_t *grp_ent, const char *name,
                      H5G_entry_t *obj_ent/*out*/);
herr_t H5G_stab_insert (H5G_entry_t *grp_ent, const char *name,
                        H5G_entry_t *obj_ent);
/*
 * Functions that understand symbol table entries.
 */
herr_t H5G_ent_decode_vec (H5F_t *f, const uint8 **pp, H5G_entry_t *ent,
                           intn n);
herr_t H5G_ent_encode_vec (H5F_t *f, uint8 **pp, const H5G_entry_t *ent,
			   intn n);
#endif
