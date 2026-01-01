/**
 * Testbench for tbird FSM module (tbird_fsm)
 */
module testbench();

	logic clk, reset, left, right, la, lb, lc, ra, rb, rc;

    initial
        forever
        begin
            clk = 0; #50; clk = 1; #50;
        end

	tbird_fsm dut(
		.clk(clk),
		.reset(reset),
		.left(left),
		.right(right),
		.la(la),
		.lb(lb),
		.lc(lc),
		.ra(ra),
		.rb(rb),
		.rc(rc)
	);

	initial
	begin
        // Left turn sequence
        $display("--- Left turn sequence ---");
		@(negedge clk);
		reset = 1;
		left = 0;
		right = 0;
		@(posedge clk);
		@(negedge clk);
        reset = 0;
        left = 1;
        $display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
		@(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
		@(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
		@(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 111 / 000");
	    @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
    	assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");

        // Left turn sequence where left is left on for multiple cycles
        $display("--- Left turn sequence (held high) ---");
		@(negedge clk);
		reset = 1;
		left = 0;
		right = 0;
		@(posedge clk);
		@(negedge clk);
        reset = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
		@(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 111 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
        $display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
		@(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 111 / 000");
		@(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
	
        // Right turn sequence
        $display("--- Right turn sequence ---");
		@(negedge clk);
		reset = 1;
		left = 0;
		right = 0;
		@(posedge clk);
		@(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000"); 
		@(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // Right turn sequence where right is held high for multiple cycles
        $display("--- Right turn sequence (held high) ---");
		@(negedge clk);
		reset = 1;
		left = 0;
		right = 0;
		@(posedge clk);
		@(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
		@(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // Both inputs high (no state change)
        $display("--- Both inputs high (no state change) ---");
		@(negedge clk);
		reset = 1;
		left = 0;
		right = 0;
		@(posedge clk);
		@(negedge clk);
        reset = 0;
        left = 1;
        right = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");
		@(negedge clk);
        left = 0;
		right = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");

        // Both inputs low (no state change)
        $display("--- Both inputs low (no state change) ---");
		@(negedge clk);
		reset = 1;
		left = 0;
		right = 0;
		@(posedge clk);
		@(negedge clk);
        reset = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");
		@(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected Init: 000 / 000");

        // Reset during first left state
        @(negedge clk);
        $display("--- Reset during first left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
        left = 0;
        reset = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
        reset = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");

        // Reset during second left state
        @(negedge clk);
        $display("--- Reset during second left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
        reset = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
        @(negedge clk);
        reset = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");

        // Reset during third left state
        @(negedge clk);
        $display("--- Reset during third left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
        @(negedge clk);
        reset = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 111 / 000");
        @(negedge clk);
        reset = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");

        // reset during first right state
        @(negedge clk);
        $display("--- Reset during first right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        reset = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        reset = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // reset during second right state
        @(negedge clk);
        $display("--- Reset during second right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        reset = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        reset = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // reset during third right state
        @(negedge clk);
        $display("--- Reset during third right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        reset = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        reset = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // left input during first left state
        @(negedge clk);
        $display("--- Left input during first left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
        left = 1;
        $display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
		left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 111 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");

        // left input during second left state
        @(negedge clk);
        $display("--- Left input during second left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 111 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");

        // left input during third left state
        @(negedge clk);
        $display("--- Left input during third left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 001 / 000");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 011 / 000");
        @(negedge clk);
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 111 / 000");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected L1: 000 / 000");

        // left input during first right state
        @(negedge clk);
        $display("--- Left input during first right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // left input during second right state
        @(negedge clk);
        $display("--- Left input during second right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // left input during third right state
        @(negedge clk);
        $display("--- Left input during third right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        left = 1;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        left = 0;
		$display(" t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // right input during first left state
        @(negedge clk);
        $display("--- Right input during first left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 001 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 011 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 111 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // right input during second left state
        @(negedge clk);
        $display("--- Right input during second left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        left = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 001 / 000");
        @(negedge clk);
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 011 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 111 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // right input during third left state
        @(negedge clk);
        $display("--- Right input during third left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        left = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 001 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 011 / 000");
        @(negedge clk);
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 111 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // right input during first right state
        @(negedge clk);
        $display("--- Right input during first right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // right input during second right state
        @(negedge clk);
        $display("--- Right input during second right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // right input during third right state
        @(negedge clk);
        $display("--- Right input during third right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // both inputs high during first left state
        @(negedge clk);
        $display("--- Both inputs high during first left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 1;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 001 / 000");
        @(negedge clk);
        right = 0;
        left = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 011 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 111 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // both inputs high during second left state
        @(negedge clk);
        $display("--- both inputs high during second left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        left = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 001 / 000");
        @(negedge clk);
        left = 1;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 011 / 000");
        @(negedge clk);
        left = 0;
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 111 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // both inputs high during third left state
        @(negedge clk);
        $display("--- both inputs high during third left state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        left = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 001 / 000");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 011 / 000");
        @(negedge clk);
        left = 1;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===1 & lb===1 & lc===1 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 111 / 000");
        @(negedge clk);
        left = 0;
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // both inputs high during first right state
        @(negedge clk);
        $display("--- Both inputs high during first right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb  ===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        left = 1;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000"); 

        // both inputs high during second right state
        @(negedge clk);
        $display("--- both inputs high during second right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        right = 1;
        left = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        left = 0;
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        // both inputs high during third right state
        @(negedge clk);
        $display("--- both inputs high during third right state ---");
        reset = 1;
        left = 0;
        right = 0;
        @(posedge clk);
        @(negedge clk);
        reset = 0;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");
        @(negedge clk);
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===0 & rc===0) else $error("Expected R1: 000 / 100");
        @(negedge clk);
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===0) else $error("Expected R1: 000 / 110");
        @(negedge clk);
        left = 1;
        right = 1;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===1 & rb===1 & rc===1) else $error("Expected R1: 000 / 111");
        @(negedge clk);
        left = 0;
        right = 0;
        $display("t=%0t  lc/lb/la=%0b%0b%0b ra/rb/rc=%0b%0b%0b",$time,lc,lb,la,ra,rb,rc);
        assert(la===0 & lb===0 & lc===0 & ra===0 & rb===0 & rc===0) else $error("Expected R1: 000 / 000");

        $display("Testbench completed.");
    end
endmodule
