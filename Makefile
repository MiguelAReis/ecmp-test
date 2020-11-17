#simulator flags
VLOG = iverilog -W all -ILIB/hardware/include


VSRC := solution.v solution_tb.v


circuit.vcd: $(VSRC)
	$(VLOG) $(VSRC)
	./a.out $(LOG)

waves: circuit.vcd
	gtkwave -a waves.gtkw $< &

clean:
	@rm -f ./a.out *.log *~ *.vcd

.PHONY: waves clean
