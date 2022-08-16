---
title: PU-NTM (T-DNC/NTM-PU)
author: QueenField
geometry: "left=3cm,right=2cm,top=3cm,bottom=2cm"
---

![QueenField](../icon.jpg)

# 1. Mechanics

# 2. Information

## 2.1. Bit

### 2.2.1. YES/NOT Gate

### 2.2.2. AND/NAND Gate

### 2.2.3. OR/NOR Gate

### 2.2.4. XOR/XNOR Gate

## 2.3. Combinational Logic

### 2.3.1. Arithmetic Circuits

### 2.3.2. Logic Circuits

## 2.3. Combinational Logic

## 2.4. Finite State Machine

$${\displaystyle T = (Q, \Sigma, \delta, q_{0}, F)}$$
$${\displaystyle Q \subseteq H}$$
$${\displaystyle \delta : Q \times \Sigma \otimes Q \rightarrow Q}$$

## 2.5. Pushdown Automaton

$${\displaystyle T = (Q, \Sigma, b, \Gamma, \delta, q_{0}, F)}$$
$${\displaystyle Q \subseteq H}$$
$${\displaystyle \delta : \Sigma \times Q \otimes \Gamma \to \Sigma \times Q \otimes \Gamma \times \{L, R\}}$$

# 3. Neural Network

## 3.1. Feedforward Neural Network

$${\displaystyle {\begin{aligned}h_{t} = \sigma_{g}(W_{h} \cdot x_{t}+U_{h} \cdot h_{t-1}+b_{h})\\y_{t} = \sigma_{g}(W_{y} \cdot h_{t}+b_{y})\end{aligned}}}$$

$${\displaystyle {\begin{aligned}h_{t} = \sigma_{g}(W_{h} \star x_{t}+U_{h} \star h_{t-1}+b_{h})\\y_{t} = \sigma_{g}(W_{y} \star h_{t}+b_{y})\end{aligned}}}$$

## 3.2. Long Short Term Memory Neural Network

$${\displaystyle {\begin{aligned}a_{t} = \sigma_{g}(W_{a} \cdot x_{t}+U_{a} \cdot h_{t-1}+b_{a})\\f_{t} = \sigma_{g}(W_{f} \cdot x_{t}+U_{f} \cdot h_{t-1}+b_{f})\\i_{t} = \sigma_{g}(W_{i} \cdot x_{t}+U_{i} \cdot h_{t-1}+b_{i})\\o_{t} = \sigma_{g}(W_{o} \cdot x_{t}+U_{o} \cdot h_{t-1}+b_{o})\\c_{t} = f_{t} \circ c_{t-1}+i_{t} \circ a_{t}\\h_{t} = o_{t} \circ \sigma_{g}(c_{t}))\end{aligned}}}$$

$${\displaystyle {\begin{aligned}a_{t} = \sigma_{g}(W_{a} \star x_{t}+U_{a} \star h_{t-1}+b_{a})\\f_{t} = \sigma_{g}(W_{f} \star x_{t}+U_{f} \star h_{t-1}+b_{f})\\i_{t} = \sigma_{g}(W_{i} \star x_{t}+U_{i} \star h_{t-1}+b_{i})\\o_{t} = \sigma_{g}(W_{o} \star x_{t}+U_{o} \star h_{t-1}+b_{o})\\c_{t} = f_{t} \circ c_{t-1}+i_{t} \circ a_{t}\\h_{t} = o_{t} \circ \sigma_{g}(c_{t}))\end{aligned}}}$$

## 3.3. Transformer Neural Network

$${\displaystyle {\begin{aligned}{\text{attention}}(Q, K, V)={\text{softmax}}\left({\frac{QK^{\mathrm{T}}}{\sqrt{d_{k}}}}\right)V\end{aligned}}}$$

# 4. Turing Machine

$${\displaystyle T = (Q, \Sigma, b, \Gamma, \delta, q_{0}, F)}$$
$${\displaystyle Q \subseteq H}$$
$${\displaystyle \delta : \Sigma \times Q \otimes \Gamma \to \Sigma \times Q \otimes \Gamma \times \{L, R\}}$$

## 4.1. Neural Turing Machine

* Definitions
$${\displaystyle {\mathcal{D}}(\mathbf{u},\mathbf{v})={\frac{\mathbf{u} \cdot \mathbf{v}}{\|\mathbf{u} \| \cdot \| \mathbf{v} \|}}}$$

* Reading
$$\sum_{i=0}^{M-1} w_t(i) = 1; \quad 0 \leq w_t(i) \leq 1$$
$$\mathbf{r}_t \longleftarrow \sum_{i=0}^{M-1}{w_t(i) \mathbf{M}_t(i)}$$

* Writing
$$\mathbf{\tilde{M}}_t(i) \longleftarrow \mathbf{M}_{t-1}(i) \left[\mathbf{1}-w_t(i) \mathbf{e}_t\right]$$
$$\mathbf{M}_t(i) \longleftarrow \mathbf{\tilde{M}}_t(i) + w_t(i)\, \mathbf{a}_t$$

* Addressing
$$w^c_t(i) \longleftarrow \frac{\exp\bigg(\beta_t \mathcal{D} \big[\mathbf{k}_t, \mathbf{M}_t(i)\big]\bigg)}{\sum_{j=0}^{N-1} \exp\bigg(\beta_t \mathcal{D} \big[\mathbf{k}_t, \mathbf{M}_t(j)\big]\bigg)}$$
$$\mathbf{w}^g_t \longleftarrow g_t \mathbf{w}^c_{t}  + (1-g_t) \mathbf{w}_{t-1}$$
$$\tilde{w}_t(i) \longleftarrow \sum_{j=0}^{N-1} w^g_t(j)\, s_t(i-j)$$
$$w_t(i) \longleftarrow \frac{\tilde{w}_t(i)^{\gamma_t}}{\sum_{j=0}^{N-1} \tilde{w}_t(j)^{\gamma_t}}$$

### 4.1.1. Feedforward Neural Turing Machine

### 4.1.2. LSTM Neural Turing Machine

### 4.1.3. Transformer Neural Turing Machine

## 4.2. Differentiable Neural Computer

* Definitions
$${\displaystyle {\mathcal{D}}(\mathbf{u},\mathbf{v})={\frac{\mathbf{u} \cdot \mathbf{v}}{\|\mathbf{u} \| \cdot \| \mathbf{v} \|}}}$$
$${\displaystyle \sigma(x)=\frac{1}{1+e^{-x}}}$$
$${\displaystyle {\text{oneplus}}(x)=1+\log(1+e^{x})}$$
$${\displaystyle {\text{softmax}}(\mathbf{x})_{j}={\frac{e^{x_{j}}}{\sum_{k=1}^{K}e^{x_{k}}}}}$$

* Addressing
$${\displaystyle M_{t}=M_{t-1}\circ (E-\mathbf{w}_{t}^{w}\mathbf{e}_{t}^{\intercal})+\mathbf{w}_{t}^{w}\mathbf{v}_{t}^{\intercal}}$$
$${\displaystyle \mathbf{u}_{t}=(\mathbf{u}_{t-1}+\mathbf{w}_{t-1}^{w}-\mathbf{u}_{t-1}\circ \mathbf{w}_{t-1}^{w})\circ{\boldsymbol{\psi}}_{t}}$$
$${\displaystyle \mathbf{p}_{t}=\left(1-\sum_{i}\mathbf{w}_{t}^{w}[i]\right)\mathbf{p}_{t-1}+\mathbf{w}_{t}^{w}}$$
$${\displaystyle L_{t}=(\mathbf{1}-\mathbf{I})\left[(1-\mathbf{w}_{t}^{w}[i]-\mathbf{w}_{t}^{j})L_{t-1}[i,j]+\mathbf{w}_{t}^{w}[i]\mathbf{p}_{t-1}^{j}\right]}$$
$${\displaystyle \mathbf{w}_{t}^{w}=g_{t}^{w}[g_{t}^{a}\mathbf{a}_{t}+(1-g_{t}^{a})\mathbf{c}_{t}^{w}]}$$
$${\displaystyle \mathbf{w}_{t}^{r,i}={\boldsymbol{\pi}}_{t}^{i}[1]\mathbf{b}_{t}^{i}+{\boldsymbol{\pi}}_{t}^{i}[2]\mathbf{c}_{t}^{r,i}+{\boldsymbol{\pi}}_{t}^{i}[3]\mathbf{f}_{t}^{i}}$$
$${\displaystyle \mathbf{r}_{t}^{i}=M_{t}^{\intercal}\mathbf{w}_{t}^{r,i}}$$
$${\displaystyle {\mathcal{C}}(M,\mathbf{k},\beta)[i]={\frac{\exp\{{\mathcal{D}}(\mathbf{k},M[i,\cdot])\beta \}}{\sum_{j}\exp\{{\mathcal{D}}(\mathbf{k},M[j,\cdot])\beta \}}}}$$
$${\displaystyle \mathbf{a}_{t}[\phi_{t}[j]]=(1-\mathbf{u}_{t}[\phi_{t}[j]])\prod_{i=1}^{j-1}\mathbf{u}_{t}[\phi_{t}[i]]}$$
$${\displaystyle \mathbf{c}_{t}^{w}={\mathcal{C}}(M_{t-1},\mathbf{k}_{t}^{w},\beta_{t}^{w})}$$
$${\displaystyle \mathbf{c}_{t}^{r,i}={\mathcal{C}}(M_{t-1},\mathbf{k}_{t}^{r,i},\beta_{t}^{r,i})}$$
$${\displaystyle \mathbf{f}_{t}^{i}=L_{t}\mathbf{w}_{t-1}^{r,i}}$$
$${\displaystyle \mathbf{b}_{t}^{i}=L_{t}^{\intercal}\mathbf{w}_{t-1}^{r,i}}$$
$${\displaystyle {\boldsymbol{\psi}}_{t}=\prod_{i=1}^{R}\left(\mathbf{1}-f_{t}^{i}\mathbf{w}_{t-1}^{r,i}\right)}$$

### 4.2.1. Feedforward Differentiable Neural Computer

### 4.2.2. LSTM Differentiable Neural Computer

### 4.2.3. Transformer Differentiable Neural Computer

# 5. Computer Architecture

## 5.1. von Neumann Architecture

### 5.1.1. Control Unit

### 5.1.2. ALU

### 5.1.3. Memory Unit

### 5.1.4. I/O Unit

## 5.2. Harvard Architecture

### 5.2.1. Control Unit

### 5.2.2. ALU

### 5.2.3.Memory Unit

### 5.2.4.I/O Unit
