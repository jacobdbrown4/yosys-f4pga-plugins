/*
 * Copyright 2020-2022 F4PGA Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 */
#ifndef _APPLY_TMR_H_
#define _APPLY_TMR_H_

#include "kernel/yosys.h"

#define COPY_AMOUNT 3

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN
// YOSYS_NAMESPACE_BEGIN

struct ApplyTMRPass : public Pass {
   ApplyTMRPass() : Pass("apply_tmr") { }

//    private:
        void replicate_module(RTLIL::Design *new_design, RTLIL::Module *module, std::string suffix);
        void replicate_wires(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix);
        void replicate_cells(RTLIL::Module *old_module, RTLIL::Module *new_module, RTLIL::Design *new_design, std::string suffix);
        void fix_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, int i, std::string suffix);
        void fix_non_leaf_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, std::string suffix);
        void print_connections(RTLIL::Cell *new_cell);
        bool check_replication(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix);
        std::map<std::string, std::set<std::string>> get_connections(RTLIL::Module *module);
        std::string remove_suffix_from_name(std::string name, std::string suffix);
    // public:
        void execute(vector<string>, Design* design) override;

} ApplyTMRPass;

PRIVATE_NAMESPACE_END
// YOSYS_NAMESPACE_END

#endif // _APPLY_TMR_H_
