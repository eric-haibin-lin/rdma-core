# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
# Copyright (c) 2019 Mellanox Technologies, Inc. All rights reserved. See COPYING file

from libcpp cimport bool

cimport pyverbs.libibverbs as v


cdef extern from 'infiniband/mlx5dv.h':

    cdef struct mlx5dv_context_attr:
        unsigned int    flags
        unsigned long   comp_mask

    cdef struct mlx5dv_cqe_comp_caps:
        unsigned int    max_num
        unsigned int    supported_format

    cdef struct mlx5dv_sw_parsing_caps:
        unsigned int    sw_parsing_offloads
        unsigned int    supported_qpts

    cdef struct mlx5dv_striding_rq_caps:
        unsigned int    min_single_stride_log_num_of_bytes
        unsigned int    max_single_stride_log_num_of_bytes
        unsigned int    min_single_wqe_log_num_of_strides
        unsigned int    max_single_wqe_log_num_of_strides
        unsigned int    supported_qpts

    cdef struct mlx5dv_context:
        unsigned char           version
        unsigned long           flags
        unsigned long           comp_mask
        mlx5dv_cqe_comp_caps    cqe_comp_caps
        mlx5dv_sw_parsing_caps  sw_parsing_caps
        mlx5dv_striding_rq_caps striding_rq_caps
        unsigned int            tunnel_offloads_caps
        unsigned int            max_dynamic_bfregs
        unsigned long           max_clock_info_update_nsec
        unsigned int            flow_action_flags
        unsigned int            dc_odp_caps

    bool mlx5dv_is_supported(v.ibv_device *device)
    v.ibv_context* mlx5dv_open_device(v.ibv_device *device,
                                      mlx5dv_context_attr *attr)
    int mlx5dv_query_device(v.ibv_context *ctx, mlx5dv_context *attrs_out)
