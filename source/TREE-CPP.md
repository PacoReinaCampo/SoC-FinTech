```
code
├── arithmetic
│   ├── matrix
│   │   ├── **ntm_matrix_adder.cpp**
│   │   ├── **ntm_matrix_divider.cpp**
│   │   └── **ntm_matrix_multiplier.cpp**
│   ├── scalar
│   │   ├── **ntm_scalar_adder.cpp**
│   │   ├── **ntm_scalar_divider.cpp**
│   │   └── **ntm_scalar_multiplier.cpp**
│   ├── tensor
│   │   ├── **ntm_tensor_adder.cpp**
│   │   ├── **ntm_tensor_divider.cpp**
│   │   └── **ntm_tensor_multiplier.cpp**
│   └── vector
│       ├── **ntm_vector_adder.cpp**
│       ├── **ntm_vector_divider.cpp**
│       └── **ntm_vector_multiplier.cpp**
├── controller
│   ├── FNN
│   │   ├── convolutional
│   │   │   └── ntm_controller.cpp
│   │   └── standard
│   │       └── ntm_controller.cpp
│   ├── LSTM
│   │   ├── convolutional
│   │   │   ├── ntm_activation_gate_vector.cpp
│   │   │   ├── ntm_controller.cpp
│   │   │   ├── ntm_forget_gate_vector.cpp
│   │   │   ├── ntm_hidden_gate_vector.cpp
│   │   │   ├── ntm_input_gate_vector.cpp
│   │   │   ├── ntm_output_gate_vector.cpp
│   │   │   └── ntm_state_gate_vector.cpp
│   │   └── standard
│   │       ├── ntm_activation_gate_vector.cpp
│   │       ├── ntm_controller.cpp
│   │       ├── ntm_forget_gate_vector.cpp
│   │       ├── ntm_hidden_gate_vector.cpp
│   │       ├── ntm_input_gate_vector.cpp
│   │       ├── ntm_output_gate_vector.cpp
│   │       └── ntm_state_gate_vector.cpp
│   └── transformer
│       ├── components
│       │   ├── ntm_masked_multi_head_attention.cpp
│       │   ├── ntm_masked_scaled_dot_product_attention.cpp
│       │   ├── ntm_multi_head_attention.cpp
│       │   └── ntm_scaled_dot_product_attention.cpp
│       ├── fnn
│       │   └── ntm_fnn.cpp
│       ├── functions
│       │   ├── ntm_layer_norm.cpp
│       │   └── ntm_positional_encoding.cpp
│       ├── inputs
│       │   ├── ntm_inputs_vector.cpp
│       │   ├── ntm_keys_vector.cpp
│       │   ├── ntm_queries_vector.cpp
│       │   └── ntm_values_vector.cpp
│       ├── lstm
│       │   ├── ntm_activation_gate_vector.cpp
│       │   ├── ntm_forget_gate_vector.cpp
│       │   ├── ntm_hidden_gate_vector.cpp
│       │   ├── ntm_input_gate_vector.cpp
│       │   ├── ntm_lstm.cpp
│       │   ├── ntm_output_gate_vector.cpp
│       │   └── ntm_state_gate_vector.cpp
│       └── top
│           ├── ntm_controller.cpp
│           ├── ntm_decoder.cpp
│           └── ntm_encoder.cpp
├── dnc
│   ├── memory
│   │   ├── dnc_addressing.cpp
│   │   ├── dnc_allocation_weighting.cpp
│   │   ├── dnc_backward_weighting.cpp
│   │   ├── dnc_forward_weighting.cpp
│   │   ├── dnc_matrix_content_based_addressing.cpp
│   │   ├── dnc_memory_matrix.cpp
│   │   ├── dnc_memory_retention_vector.cpp
│   │   ├── dnc_precedence_weighting.cpp
│   │   ├── dnc_read_content_weighting.cpp
│   │   ├── dnc_read_vectors.cpp
│   │   ├── dnc_read_weighting.cpp
│   │   ├── dnc_sort_vector.cpp
│   │   ├── dnc_temporal_link_matrix.cpp
│   │   ├── dnc_usage_vector.cpp
│   │   ├── dnc_vector_content_based_addressing.cpp
│   │   ├── dnc_write_content_weighting.cpp
│   │   └── dnc_write_weighting.cpp
│   ├── top
│   │   ├── dnc_interface_matrix.cpp
│   │   ├── dnc_interface_top.cpp
│   │   ├── dnc_interface_vector.cpp
│   │   ├── dnc_output_vector.cpp
│   │   └── dnc_top.cpp
│   └── trained
│       └── dnc_trained_top.cpp
├── math
│   ├── algebra
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_convolution.cpp**
│   │   │   ├── ntm_matrix_inverse.cpp
│   │   │   ├── **ntm_matrix_multiplication.cpp**
│   │   │   ├── **ntm_matrix_product.cpp**
│   │   │   ├── **ntm_matrix_summation.cpp**
│   │   │   ├── **ntm_matrix_transpose.cpp**
│   │   │   ├── **ntm_matrix_vector_convolution.cpp**
│   │   │   ├── **ntm_matrix_vector_product.cpp**
│   │   │   └── **ntm_transpose_vector_product.cpp**
│   │   ├── scalar
│   │   │   ├── **ntm_scalar_multiplication.cpp**
│   │   │   └── **ntm_scalar_summation.cpp**
│   │   ├── tensor
│   │   │   ├── ntm_tensor_convolution.cpp
│   │   │   ├── ntm_tensor_inverse.cpp
│   │   │   ├── ntm_tensor_matrix_convolution.cpp
│   │   │   ├── ntm_tensor_matrix_product.cpp
│   │   │   ├── ntm_tensor_multiplication.cpp
│   │   │   ├── ntm_tensor_product.cpp
│   │   │   ├── ntm_tensor_summation.cpp
│   │   │   └── ntm_tensor_transpose.cpp
│   │   └── vector
│   │       ├── **ntm_dot_product.cpp**
│   │       ├── **ntm_vector_convolution.cpp**
│   │       ├── **ntm_vector_cosine_similarity.cpp**
│   │       ├── **ntm_vector_module.cpp**
│   │       ├── **ntm_vector_multiplication.cpp**
│   │       └── **ntm_vector_summation.cpp**
│   ├── calculus
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_differentiation.cpp**
│   │   │   ├── **ntm_matrix_integration.cpp**
│   │   │   └── **ntm_matrix_softmax.cpp**
│   │   ├── tensor
│   │   │   ├── **ntm_tensor_differentiation.cpp**
│   │   │   ├── **ntm_tensor_integration.cpp**
│   │   │   └── **ntm_tensor_softmax.cpp**
│   │   └── vector
│   │       ├── **ntm_vector_differentiation.cpp**
│   │       ├── **ntm_vector_integration.cpp**
│   │       └── **ntm_vector_softmax.cpp**
│   ├── function
│   │   ├── matrix
│   │   │   ├── **ntm_matrix_logistic_function.cpp**
│   │   │   └── **ntm_matrix_oneplus_function.cpp**
│   │   ├── scalar
│   │   │   ├── **ntm_scalar_logistic_function.cpp**
│   │   │   └── **ntm_scalar_oneplus_function.cpp**
│   │   └── vector
│   │       ├── **ntm_vector_logistic_function.cpp**
│   │       └── **ntm_vector_oneplus_function.cpp**
│   └── statitics
│       ├── matrix
│       │   ├── **ntm_matrix_deviation.cpp**
│       │   └── **ntm_matrix_mean.cpp**
│       ├── scalar
│       │   ├── **ntm_scalar_deviation.cpp**
│       │   └── **ntm_scalar_mean.cpp**
│       └── vector
│           ├── **ntm_vector_deviation.cpp**
│           └── **ntm_vector_mean.cpp**
├── ntm
│   ├── memory
│   │   ├── ntm_addressing.cpp
│   │   ├── ntm_matrix_content_based_addressing.cpp
│   │   └── ntm_vector_content_based_addressing.cpp
│   ├── read_heads
│   │   └── ntm_reading.cpp
│   ├── top
│   │   ├── ntm_interface_matrix.cpp
│   │   ├── ntm_interface_top.cpp
│   │   ├── ntm_interface_vector.cpp
│   │   ├── ntm_output_vector.cpp
│   │   └── ntm_top.cpp
│   ├── trained
│   │   └── ntm_trained_top.cpp
│   └── write_heads
│       ├── ntm_erasing.cpp
│       └── ntm_writing.cpp
├── state
│   ├── feedback
│   │   ├── ntm_state_matrix_feedforward.cpp
│   │   ├── ntm_state_matrix_input.cpp
│   │   ├── ntm_state_matrix_output.cpp
│   │   └── ntm_state_matrix_state.cpp
│   ├── outputs
│   │   ├── ntm_state_vector_output.cpp
│   │   └── ntm_state_vector_state.cpp
│   └── top
│       └── ntm_state_top.cpp
└── trainer
    ├── differentiation
    │   ├── ntm_matrix_controller_differentiation.cpp
    │   └── ntm_vector_controller_differentiation.cpp
    ├── FNN
    │   ├── ntm_fnn_b_trainer.cpp
    │   ├── ntm_fnn_d_trainer.cpp
    │   ├── ntm_fnn_k_trainer.cpp
    │   ├── ntm_fnn_trainer.cpp
    │   ├── ntm_fnn_u_trainer.cpp
    │   ├── ntm_fnn_v_trainer.cpp
    │   └── ntm_fnn_w_trainer.cpp
    └── LSTM
        ├── activation
        │   ├── ntm_lstm_activation_b_trainer.cpp
        │   ├── ntm_lstm_activation_d_trainer.cpp
        │   ├── ntm_lstm_activation_k_trainer.cpp
        │   ├── ntm_lstm_activation_trainer.cpp
        │   ├── ntm_lstm_activation_u_trainer.cpp
        │   ├── ntm_lstm_activation_v_trainer.cpp
        │   └── ntm_lstm_activation_w_trainer.cpp
        ├── forget
        │   ├── ntm_lstm_forget_b_trainer.cpp
        │   ├── ntm_lstm_forget_d_trainer.cpp
        │   ├── ntm_lstm_forget_k_trainer.cpp
        │   ├── ntm_lstm_forget_trainer.cpp
        │   ├── ntm_lstm_forget_u_trainer.cpp
        │   ├── ntm_lstm_forget_v_trainer.cpp
        │   └── ntm_lstm_forget_w_trainer.cpp
        ├── input
        │   ├── ntm_lstm_input_b_trainer.cpp
        │   ├── ntm_lstm_input_d_trainer.cpp
        │   ├── ntm_lstm_input_k_trainer.cpp
        │   ├── ntm_lstm_input_trainer.cpp
        │   ├── ntm_lstm_input_u_trainer.cpp
        │   ├── ntm_lstm_input_v_trainer.cpp
        │   └── ntm_lstm_input_w_trainer.cpp
        └── output
            ├── ntm_lstm_output_b_trainer.cpp
            ├── ntm_lstm_output_d_trainer.cpp
            ├── ntm_lstm_output_k_trainer.cpp
            ├── ntm_lstm_output_trainer.cpp
            ├── ntm_lstm_output_u_trainer.cpp
            ├── ntm_lstm_output_v_trainer.cpp
            └── ntm_lstm_output_w_trainer.cpp
```

59 directories, 174 files