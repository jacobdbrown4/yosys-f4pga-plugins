# Copyright 2020-2022 F4PGA Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

TESTS = replicate

# UNIT_TESTS = trim_name

include $(shell pwd)/../../Makefile_test.common

# replicate_verify = true
replicate_verify = $(call diff_test,replicate,txt)
# get_cells_verify = true
# get_pins_verify = $(call diff_test,get_pins,txt)
# get_count_verify = true
# selection_to_tcl_list_verify = $(call diff_test,selection_to_tcl_list,txt)