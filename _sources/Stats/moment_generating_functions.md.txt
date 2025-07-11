# Expected Value

This article covers some of the properties of expected value. Here is a summary
of the properties of expected value:

* $\mathbb{E}[X + c] = \mathbb{E}[X] + c$
* $\mathbb{E}[aX] = a\mathbb{E}[X]$
* $\mathbb{E}[X + Y] = \mathbb{E}[X] + \mathbb{E}[Y]$
* $\mathbb{E}[XY] = \mathbb{E}[X] \mathbb{E}[Y]$

```{prf:theorem} 
Let $X$ be a random variable and $c$ be a constant, then:

$$
\mathbb{E}[X + c] = \mathbb{E}[X] + c
$$
```

```{prf:proof}
The proof relies on the fact that the probability that $X$ is some value $x$
does not depend on the constant $c$.

$$
\mathbb{E}[X + c] = \sum_{x \in X} p(x) (x + c)
= \sum_{x \in X} p(x) x + \sum_{x \in X} p(x) c
= \mathbb{E}[X] + c
$$
```

```{prf:theorem} 
Let $X$ be a random variable and $a$ be a constant, then:

$$
\mathbb{E}[aX] = a\mathbb{E}[X]
$$
```

```{prf:proof}
The probability that $X$ is $x$ does not depend on $a$.

$$
\mathbb{E}[aX] = \sum_{x \in X} a p(x) x = a \mathbb{E}[X]
$$
```

```{prf:theorem} Linearity of Expected Value
Let $X$ and $Y$ be two independent random variables, then:

$$
    \mathbb{E}[X + Y] = \mathbb{E}[X] + \mathbb{E}[Y]
$$
```

```{prf:proof}
By the definition of expected value:

$$
    \mathbb{E}[X + Y] & = \sum_{x, y \in X, Y} p(x, y) (x + y) \\
    & = \sum_{x \in X} \sum_{y \in Y} p(x) p(y) (x + y) \\
    & = \sum_{x \in X} \sum_{y \in Y} p(x) p(y) x + \sum_{x \in X} \sum_{y \in Y} p(x) p(y) y \\
    & = \sum_{x \in X} p(x) x \sum_{y \in Y} p(y) + \sum_{y \in Y} p(y) y \sum_{x \in X} p(x) \\
    & = \sum_{x \in X} p(x) x + \sum_{y \in Y} p(y) y \\
    & = \mathbb{E}[X] + \mathbb{E}[Y]
$$
```

```{prf:theorem} Product of Expected Value
Let $X$ and $Y$ be two independent random variables, then:

$$
    \mathbb{E}[XY] = \mathbb{E}[X] \mathbb{E}[Y]
$$
```

```{prf:proof}
Again, by the definition of expected value:

$$
    \mathbb{E}[XY] & = \sum_{x \in X}\sum_{y \in Y} p(x) x p(y) y \\
    & = \sum_{x \in X} p(x) x \sum_{y \in Y} p(y) y \\
    & = \sum_{x \in X} p(x) x \mathbb{E}[y] \\
    & = \mathbb{E}[Y] \mathbb{E}[X] \\
$$
```
