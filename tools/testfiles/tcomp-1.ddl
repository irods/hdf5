#############################
Expected output for 'h5dump tcompound.h5'
#############################
HDF5 "tcompound.h5" {
GROUP "/" {
   DATATYPE "#5992:0" {
      H5T_STD_I32BE "int";
      H5T_IEEE_F32BE "float";
   } 
   DATASET "dset1" {
      DATATYPE {
         H5T_STD_I32BE "a_name";
         H5T_IEEE_F32BE "b_name";
         H5T_IEEE_F64BE "c_name";
      } 
      DATASPACE { SIMPLE ( 5 ) / ( 5 ) } 
      DATA {
         {
            0,
            0,
            1
         },
         {
            1,
            1,
            0.5
         },
         {
            2,
            4,
            0.333333
         },
         {
            3,
            9,
            0.25
         },
         {
            4,
            16,
            0.2
         }
      } 
   } 
   GROUP "group1" {
      DATASET "dset2" {
         DATATYPE {
            "/type1"
         } 
         DATASPACE { SIMPLE ( 5 ) / ( 5 ) } 
         DATA {
            {
               0,
               0
            },
            {
               1,
               1.1
            },
            {
               2,
               2.2
            },
            {
               3,
               3.3
            },
            {
               4,
               4.4
            }
         } 
      } 
      DATASET "dset3" {
         DATATYPE {
            "/type2"
         } 
         DATASPACE { SIMPLE ( 3, 6 ) / ( 3, 6 ) } 
         DATA {
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            },
            {
               [ 0, 1, 2, 3 ],
               [ 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 
               0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 
               0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 
               0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 
               0.5, 0.5, 0.5, 0.5, 0.5, 0.5 ]
            }
         } 
      } 
      DATASET "dset4" {
         DATATYPE {
            "/group1/type3"
         } 
         DATASPACE { SIMPLE ( 5 ) / ( 5 ) } 
         DATA {
            {
               0,
               0
            },
            {
               1,
               1
            },
            {
               2,
               2
            },
            {
               3,
               3
            },
            {
               4,
               4
            }
         } 
      } 
      DATATYPE "type3" {
         H5T_STD_I32BE "int";
         H5T_IEEE_F32BE "float";
      } 
   } 
   GROUP "group2" {
      DATASET "dset5" {
         DATATYPE {
            "/#5992:0"
         } 
         DATASPACE { SIMPLE ( 5 ) / ( 5 ) } 
         DATA {
            {
               0,
               0
            },
            {
               1,
               0.1
            },
            {
               2,
               0.2
            },
            {
               3,
               0.3
            },
            {
               4,
               0.4
            }
         } 
      } 
   } 
   DATATYPE "type1" {
      H5T_STD_I32BE "int_name";
      H5T_IEEE_F32BE "float_name";
   } 
   DATATYPE "type2" {
      H5T_STD_I32BE "int_array"[4];
      H5T_IEEE_F32BE "float_array"[5][6];
   } 
} 
} 
