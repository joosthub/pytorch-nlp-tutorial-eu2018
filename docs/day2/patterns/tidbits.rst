Small Tidbits
=============


Set Seed Everywhere
-------------------

.. code-block:: python

   import numpy as np
   import torch

   def set_seed_everywhere(seed, cuda):(
          """Set the seed for numpy and pytorch
   
          Args:
              seed (int): the seed to set everything to
              cuda (bool): whether to set the cuda seed as well
       """
       np.random.seed(seed)
       torch.manual_seed(seed)
       if cuda:
           torch.cuda.manual_seed_all(seed)
