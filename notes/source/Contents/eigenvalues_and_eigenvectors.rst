Eigenvalues and Eigenvectors
============================

For a square matrix :math:`A`, its eigenvectors are vectors :math:`x` such that,

.. math::

   Ax = \lambda x

Where :math:`\lambda \in R` is an eigenvalue of :math:`x`. In other words, the eigenvectors of :math:`A` are vectors that when transformed by :math:`A` are only scaled by some factor :math:`\lambda` rather than, for example, changing direction.

Finding Eigenvalues and Eigenvectors
------------------------------------

In our equation above, there are two unknows: :math:`\lambda`, and :math:`x`. Rearanging, some of the terms, we get,

.. math::

   (A - \lambda I) x = 0

Where :math:`I` is the identity matrix. If :math:`A - \lambda I` is invertible then :math:`(A - \lambda I) ^ {-1} (A - \lambda I) x = (A - \lambda I) ^ {-1} 0 \implies x = 0`. Therefore, for :math:`x` to have a non-zero solution, :math:`A - \lambda I` cannot be invertible, and thus,

.. math::

   \det (A - \lambda I) = 0

This gives a formula to find the eigenvalues of :math:`A` which can then be substituted into :math:`(A - \lambda I) x = 0` to find the eigenvectors :math:`x`.

Properties of Eigenvalues and Eigenvectors
------------------------------------------

Several properties of eigenvalues and eigenvectors.

The determinant of :math:`A` is the product of its eigenvalues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The eigenvalues :math:`\lambda_1, \lambda_2, \dots, \lambda_n`, are the roots of its characteristic polynomial.

.. math::

   \det (A - \lambda I) = (\lambda_1 - \lambda) (\lambda_2 - \lambda) \dots (\lambda_n - \lambda)

Setting :math:`\lambda` to :math:`0`, we get,

.. math::

   \det (A) = \lambda_1 \lambda_2 \dots \lambda_n 

The trace of :math:`A` is equal to the sum of its eigenvalues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For this, we only prove for the :math:`2 \times 2` case. Let :math:`A` be the following matrix,

.. math::

   A = \begin{pmatrix}
      a & b \\
      c & d \\
   \end{pmatrix}

Find the eigenvalues of :math:`A` using its charateristic polynomial.

.. math::

   \det (A - \lambda I) = (a - \lambda) (d - \lambda) - bc = \lambda ^ 2 - (a + d) \lambda - bc

Using the quatratic formula, we get,

.. math::

   \lambda = \frac{a + d \pm \sqrt{\ldots}}{2}

Therefore,

.. math::

   \lambda_1 + \lambda_2 = a + d