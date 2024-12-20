module compare(
	input [7:0] A,B, 
	output A_less_B, A_equal_B, A_greater_B
);

	wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6;
	
	compare_4 bit3_0 (.A(A[3:0]),
							.B(B[3:0]), 
							.A_less_B(tmp1),
							.A_equal_B(tmp2),
							.A_greater_B(tmp3)); 
							
	compare_4 bit7_4 (.A(A[7:4]),
							.B(B[7:4]), 
							.A_less_B(tmp4),
							.A_equal_B(tmp5),
							.A_greater_B(tmp6)); 
	
	// A = B output 
	assign A_equal_B = tmp2 & tmp5;
	
	// A less than B output   
	assign A_less_B = tmp4 | (tmp5 & tmp1);
	
	// A greater than B output    
	assign A_greater_B = tmp6 | (tmp5 & tmp3);
endmodule