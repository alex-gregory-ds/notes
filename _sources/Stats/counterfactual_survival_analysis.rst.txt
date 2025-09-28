Survival Analysis
=================

Survival analysis is used to model the time until an event. Let :math:`F` be
the cumulative distribution function that gives the probability that the time
of the event :math:`t` occurs after :math:`T`.

.. math::

   F(t) := P(t \geq T)

The survival function is :math:`S(t) := 1 - F(t)` which is the probability the
event occurs before time :math:`T`.

The hazard function is the probability of the event occurring just after
:math:`t` given it has not happened before :math:`t` **per unit time**.
Mathematically, this is:

.. math::

   \lambda(t) := \lim_{dt \rightarrow 0} \frac{P(t \leq T < t + dt | t \leq T)} {dt}.

This can be simplified using the definition of conditional probability:

.. math::

   \lambda(t) := & \lim_{dt \rightarrow 0} \frac{P(t \leq T < t + dt | t \leq T)} {dt} \\
   = & \lim_{dt \rightarrow 0} \frac{P((t \leq T < t + dt) \cap (t \leq T))} {dt \ P(t \leq T)} \\
   = & \lim_{dt \rightarrow 0} \frac{P(t \leq T < t + dt)} {dt \ P(t \leq T)} \\
   = & \frac{1}{P(t \leq T)} \lim_{dt \rightarrow 0} \frac{P(t \leq T < t + dt)}{dt} \\

Since :math:`F` is a cumulative density function, we have:

.. math::

    P(t \leq T < t + dt) := & P(T < t + dt) - P(T \leq t) \\
    = & P(T \leq t + dt) - P(T \leq t) \\
    = & F(t + dt) - F(t).

On the second line, we used the fact that
:math:`P(T < t + dt) = P(T \leq t + dt)` because :math:`P` is a continuous
probability distribution. Putting this into the limit above, we get:

.. math::

   \lim_{dt \rightarrow 0} \frac{P(t \leq T < t + dt)}{dt}
   = \lim_{dt \rightarrow 0} \frac{P(T < t + dt) - P(t \leq T)}{dt}
   = \lim_{dt \rightarrow 0} \frac{F(t + dt) - F(t)}{dt}.

By definition, this is the derivative of :math:`F` which we will refer to as
:math:`f`. So:

.. math::

   \lim_{dt \rightarrow 0} \frac{F(t + dt) - F(t)}{dt}
   = \frac{dF}{dt}
   = f(t)

Because :math:`F` is a cumulative distribution function, its derivative is the
probability distribution function. So, :math:`f` is the probability density
function of :math:`F`.

By definition, :math:`P(t \leq T) = 1 - P(t \geq T) = S(t)`. Putting this all
together, we can simplify :math:`\lambda(t)` further:

.. math::

   \lambda(t) = \frac{1}{P(t \leq T)} \lim_{dt \rightarrow 0} \frac{P(t \leq T < t + dt)}{dt} = \frac{f(t)}{S(t)}


Problem Formulation
-------------------

Suppose we have :math:`N` participants with :math:`N_1` being treated and
:math:`N_0` in the control group so :math:`N = N_1 + N_0`. Each individual has
the following attributes:

* :math:`X`: covariates which can be a mixture of categorical and continuous
  variables.
* :math:`A`: Treatment indicator where :math:`A = 0` for the controls and
  :math:`A = 1` for the treated.
* :math:`T`: Outcome of interest such as the time of death. :math:`T_0` and
  :math:`T_1` is the outcome under control and treatment respectively.
* :math:`\delta`: Censoring indicates where :math:`\delta = 1` means the
  outcome was observed and :math:`\delta = 0` means the outcome was not
  observed.
* :math:`C` Censoring time. The actual outcome is observed if :math:`T_A < C`
  and :math:`\delta = 1`.
* :math:`Y = \min(T_A, C)`: The actual observed time.

We only observed :math:`T_A` meaning :math:`T_{1 - A}` is the unobserved
counterfactual.

This paper proposes a method for estimating :math:`p(T_1 | X)` and
:math:`p(T_0 | X)` which is the probability of observing outcomes :math:`T_0`
and :math:`T_0` from the covariates :math:`X`.

Standard Definition
-------------------

If an individual has survived up to time :math:`t`, how likely is the event to
occur in the next tiny interval :math:`[t, t + dt)`?
