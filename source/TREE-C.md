```
code
├── arithmetic
│   ├── matrix
│   │   ├── **ntm_matrix_adder.c**
│   │   ├── **ntm_matrix_divider.c**
│   │   └── **ntm_matrix_multiplier.c**
│   ├── scalar
│   │   ├── **ntm_scalar_adder.c**
│   │   ├── **ntm_scalar_divider.c**
│   │   └── **ntm_scalar_multiplier.c**
│   ├── tensor
│   │   ├── **ntm_tensor_adder.c**
│   │   ├── **ntm_tensor_divider.c**
│   │   └── **ntm_tensor_multiplier.c**
│   └── vector
│       ├── **ntm_vector_adder.c**
│       ├── **ntm_vector_divider.c**
│       └── **ntm_vector_multiplier.c**
├── controller
│   ├── FNN
│   │   ├── convolutional
│   │   │   └── ntm_controller.c
│   │   └── standard
│   │       └── ntm_controller.c
│   ├── LSTM
│   │   ├── convolutional
│   │   │   ├── ntm_activation_gate_vector.c
│   │   │   ├── ntm_controller.c
│   │   │   ├── ntm_forget_gate_vector.c
│   │   │   ├── ntm_hidden_gate_vector.c
│   │   │   ├── ntm_input_gate_vector.c
│   │   │   ├── ntm_output_gate_vector.c
│   │   │   └── ntm_state_gate_vector.c
│   │   └── standard
│   │       ├── ntm_activation_gate_vector.c
│   │       ├── ntm_controller.c
│   │       ├── ntm_forget_gate_vector.c
│   │       ├── ntm_hidden_gate_vector.c
│   │       ├── ntm_input_gate_vector.c
│   │       ├── ntm_output_gate_vector.c
│   │       └── ntm_state_gate_vector.c
│   └── transformer
│       ├── components
│       │   ├── ntm_masked_multi_head_attention.c
│       │   ├── ntm_masked_scaled_dot_product_attention.c
│       │   ├── ntm_multi_head_attention.c
│       │   └── ntm_scaled_dot_product_attention.c
│       ├── fnn
│       │   └── ntm_fnn.c
│       ├── functions
│       │   ├── ntm_layer_norm.c
│       │   └── ntm_positional_encoding.c
│       ├── inputs
│       │   ├── ntm_inputs_vector.c
│       │   ├── ntm_keys_vector.c
│       │   ├── ntm_queries_vector.c
│       │   └── ntm_values_vector.c
│       ├── lstm
│       │   ├── ntm_activation_gate_vector.c
│       │   ├── ntm_forget_gate_vector.c
│       │   ├── ntm_hidden_gate_vector.c
│       │   ├── ntm_input_gate_vector.c
│       │   ├── ntm_lstm.c
│       │   ├── ntm_output_gate_vector.c
│       │   └── ntm_state_gate_vector.c
│       └── top
│           ├── ntm_controller.c
│           ├── ntm_decoder.c
│           └── ntm_encoder.c
├── dnc
│   ├── memory
│   │   ├── dnc_addressing.c
│   │   ├── dnc_allocation_weighting.c
│   │   ├── dnc_backward_weighting.c
│   │   ├── dnc_forward_weighting.c
│   │   ├── dnc_matrix_content_based_addressing.c
│   │   ├── dnc_memory_matrix.c
│   │   ├── dnc_memory_retention_vector.c
│   │   ├── dnc_precedence_weighting.c
│   │   ├── dnc_read_content_weighting.c
│   │   ├── dnc_read_vectors.c
│   │   ├── dnc_read_weighting.c
│   │   ├── dnc_sort_vector.c
│   │   ├── dnc_temporal_link_matrix.c
│   │   ├── dnc_usage_vector.c
│   │   ├── dnc_vector_content_based_addressing.c
│   │   ├── dnc_write_content_weighting.c
│   │   └── dnc_write_weighting.c
│   ├── top
│   │   ├── dnc_interface_matrix.c
│   │   ├── dnc_interface_top.c
│   │   ├── dnc_interface_vector.c
│   │   ├── dnc_output_vector.c
│   │   └── dnc_top.c
│   └── trained
│       └── dnc_trained_top.c
├── math
│   ├── algebra
│   │   ├── matrix
│   │   │   ├── ntm_matrix_convolution.c
│   │   │   ├── ntm_matrix_inverse.c
│   │   │   ├── ntm_matrix_multiplication.c
│   │   │   ├── ntm_matrix_product.c
│   │   │   ├── ntm_matrix_summation.c
│   │   │   ├── ntm_matrix_transpose.c
│   │   │   ├── ntm_matrix_vector_convolution.c
│   │   │   ├── ntm_matrix_vector_product.c
│   │   │   └── ntm_transpose_vector_product.c
│   │   ├── scalar
│   │   │   ├── ntm_scalar_multiplication.c
│   │   │   └── ntm_scalar_summation.c
│   │   ├── tensor
│   │   │   ├── ntm_tensor_convolution.c
│   │   │   ├── ntm_tensor_inverse.c
│   │   │   ├── ntm_tensor_matrix_convolution.c
│   │   │   ├── ntm_tensor_matrix_product.c
│   │   │   ├── ntm_tensor_multiplication.c
│   │   │   ├── ntm_tensor_product.c
│   │   │   ├── ntm_tensor_summation.c
│   │   │   └── ntm_tensor_transpose.c
│   │   └── vector
│   │       ├── ntm_dot_product.c
│   │       ├── ntm_vector_convolution.c
│   │       ├── ntm_vector_cosine_similarity.c
│   │       ├── ntm_vector_module.c
│   │       ├── ntm_vector_multiplication.c
│   │       └── ntm_vector_summation.c
│   ├── calculus
│   │   ├── matrix
│   │   │   ├── ntm_matrix_differentiation.c
│   │   │   ├── ntm_matrix_integration.c
│   │   │   └── ntm_matrix_softmax.c
│   │   ├── tensor
│   │   │   ├── ntm_tensor_differentiation.c
│   │   │   ├── ntm_tensor_integration.c
│   │   │   └── ntm_tensor_softmax.c
│   │   └── vector
│   │       ├── ntm_vector_differentiation.c
│   │       ├── ntm_vector_integration.c
│   │       └── ntm_vector_softmax.c
│   ├── function
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_logistic_function.c**
│   │   │   └── **ntm_matrix_oneplus_function.c**
│   │   ├── scalar
│   │   │   ├── **ntm_scalar_logistic_function.c**
│   │   │   └── **ntm_scalar_oneplus_function.c**
│   │   └── vector
│   │       ├── **ntm_vector_logistic_function.c**
│   │       └── **ntm_vector_oneplus_function.c**
│   └── statitics
│       ├── matrix
│       │   ├── ntm_matrix_deviation.c
│       │   └── ntm_matrix_mean.c
│       ├── scalar
│       │   ├── ntm_scalar_deviation.c
│       │   └── ntm_scalar_mean.c
│       └── vector
│           ├── ntm_vector_deviation.c
│           └── ntm_vector_mean.c
├── ntm
│   ├── memory
│   │   ├── ntm_addressing.c
│   │   ├── ntm_matrix_content_based_addressing.c
│   │   └── ntm_vector_content_based_addressing.c
│   ├── read_heads
│   │   └── ntm_reading.c
│   ├── top
│   │   ├── ntm_interface_matrix.c
│   │   ├── ntm_interface_top.c
│   │   ├── ntm_interface_vector.c
│   │   ├── ntm_output_vector.c
│   │   └── ntm_top.c
│   ├── trained
│   │   └── ntm_trained_top.c
│   └── write_heads
│       ├── ntm_erasing.c
│       └── ntm_writing.c
├── state
│   ├── feedback
│   │   ├── *ntm_state_matrix_feedforward.c*
│   │   ├── *ntm_state_matrix_input.c*
│   │   ├── *ntm_state_matrix_output.c*
│   │   └── *ntm_state_matrix_state.c*
│   ├── outputs
│   │   ├── *ntm_state_vector_output.c*
│   │   └── *ntm_state_vector_state.c*
│   └── top
│       └── *ntm_state_top.c*
└── trainer
    ├── differentiation
    │   ├── ntm_matrix_controller_differentiation.c
    │   └── ntm_vector_controller_differentiation.c
    ├── FNN
    │   ├── ntm_fnn_b_trainer.c
    │   ├── ntm_fnn_d_trainer.c
    │   ├── ntm_fnn_k_trainer.c
    │   ├── ntm_fnn_trainer.c
    │   ├── ntm_fnn_u_trainer.c
    │   ├── ntm_fnn_v_trainer.c
    │   └── ntm_fnn_w_trainer.c
    └── LSTM
        ├── activation
        │   ├── ntm_lstm_activation_b_trainer.c
        │   ├── ntm_lstm_activation_d_trainer.c
        │   ├── ntm_lstm_activation_k_trainer.c
        │   ├── ntm_lstm_activation_trainer.c
        │   ├── ntm_lstm_activation_u_trainer.c
        │   ├── ntm_lstm_activation_v_trainer.c
        │   └── ntm_lstm_activation_w_trainer.c
        ├── forget
        │   ├── ntm_lstm_forget_b_trainer.c
        │   ├── ntm_lstm_forget_d_trainer.c
        │   ├── ntm_lstm_forget_k_trainer.c
        │   ├── ntm_lstm_forget_trainer.c
        │   ├── ntm_lstm_forget_u_trainer.c
        │   ├── ntm_lstm_forget_v_trainer.c
        │   └── ntm_lstm_forget_w_trainer.c
        ├── input
        │   ├── ntm_lstm_input_b_trainer.c
        │   ├── ntm_lstm_input_d_trainer.c
        │   ├── ntm_lstm_input_k_trainer.c
        │   ├── ntm_lstm_input_trainer.c
        │   ├── ntm_lstm_input_u_trainer.c
        │   ├── ntm_lstm_input_v_trainer.c
        │   └── ntm_lstm_input_w_trainer.c
        └── output
            ├── ntm_lstm_output_b_trainer.c
            ├── ntm_lstm_output_d_trainer.c
            ├── ntm_lstm_output_k_trainer.c
            ├── ntm_lstm_output_trainer.c
            ├── ntm_lstm_output_u_trainer.c
            ├── ntm_lstm_output_v_trainer.c
            └── ntm_lstm_output_w_trainer.c
```

59 directories, 174 files