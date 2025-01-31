class ${ltcl_} definition final for testing 
  duration ${short} 
  risk level ${harmless}.

  private section.
		types:
      ${z_tab} type standard table of ${z_tab} with empty key.

		class-data: osql_env type ref to if_osql_test_environment.
		"class-data: cds_env type ref to if_cds_test_environment.

		class-methods:
			class_setup,
			class_teardown.

		data cut type ref to ${zcl_}.

    methods:
			setup,
			prepare_test_data,
      ${succ_test} for testing raising cx_static_check,
			${fail_test} for testing raising cx_static_check.
endclass.


class ${ltcl_} implementation.

	method setup.
		cut = new #( ).
	endmethod.

  method ${succ_test}.
		prepare_test_data( ).
    ${cursor}cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  endmethod.

  method ${fail_test}.
		prepare_test_data( ).
    ${cursor}cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  endmethod.

	method class_setup.
		"cds_env->clear_doubles( ).
    osql_env->clear_doubles( ).
    cut = new #( ).
	endmethod.

	method class_teardown.
		"cds_env->destroy( ).
		osql_env->destroy( ).
	endmethod.

	method prepare_test_data.
  	data(${z_tab}_itab) = value ${z_tab}(
    	( ${attribute} = '' )
  	).

  	osql_env->insert_test_data( ${z_tab}_itab ).
	endmethod.

endclass.
