Take-Home Exercises
===================

Exercise 1
----------

Implement Deep Continuous Bag-of-Words (CBOW).
`Here is a link to the paper! <https://cs.umd.edu/~miyyer/pubs/2015_acl_dan.pdf>`_


Exercise 2
----------

Implement a convnet classifier to classify surnames

At the end of class, we talked about how CNNs can be used to incrementally shrink an intermediate data tensor until a dimension of size 1 is left.  

Here is a notebook that I pieced together for you to do this assignment with: https://gist.github.com/braingineer/1d7baecf2c99013d88d4d1db77449aec

Some other points that were made:

1. At first, the size of the data tensor is (batch, max_seq_len).  Then, after using the embedding layer, it is (batch, max_seq_len, embeddin_dim).  However, as was pointed out, convolutions expect the channel dimension (the features per position in the sequence) to be on the 1st position. So, a conv1d will expect: (batch, feature_dim, max_seq_len).

2. When a sequence/hierarchy of 1D convolutions are applied, they can eventually shrink the sequence dimension to size 1. This is a goal.  Specifically, you want (batch, feature_dim, 1) so that use the "squeeze" operation to remove the 1-dimension and have a single feature vector per item in the batch.

3. Once you have the correct sequence of convolutions and/or pooling operations to create your feature vectors, then you can add a Linear layer which will map from the feature vector to a prediction vector.  This can be modeled after the other examples. 
