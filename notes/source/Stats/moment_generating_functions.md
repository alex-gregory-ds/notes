# Expected Value

```{note}

This is some text

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
