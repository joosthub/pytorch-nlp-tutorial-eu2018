Tensor-Fu-1
===========


Exercise 1
----------

Task: create a tensor for prototyping using `torch.randn`_.

.. code-block:: python

   import torch
   import torch.nn as nn



Exercise 2
----------


Task: Create a linear layer which works wih x2dim

.. code-block:: python

   import torch
   import torch.nn as nn

   x2dim = torch.randn(9, 10)

   # required and default parameters:
   # fc = nn.Linear(in_features, out_features)


Exercise 3
----------

Task: Create a convolution which works on x3dim

.. code-block:: python

   import torch
   import torch.nn as nn

   x3dim = torch.randn(9, 10, 11)

   # required and default parameters:
   # conv1 = nn.Conv1d(in_channels, out_channels, kernel_size, stride=1, padding=0)
