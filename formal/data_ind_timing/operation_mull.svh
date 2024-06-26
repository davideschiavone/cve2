// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

always_comb begin
  // Formal prove only for data independent timing
  assume (data_ind_timing_i);

  assume(~div_sel_i);
  assume(~div_en_i);

  if (f_startup_count >= 3'd2) begin
    // Enable signal must be asserted in order for the state machine to advance
    assume (mult_en_i);
    assume (mult_sel_i);
    assume (operator_i == cve2_pkg::MD_OP_MULL);
  end else begin
    assume (~mult_en_i);
    assume (~mult_sel_i);
  end
end
