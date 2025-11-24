---
slug: tuples-and-lists-in-python
tags: [en]
title: "Tuples and Lists in Python"
---

_Originally posted in [Brazilian Portuguese](tuplas-e-listas-no-python.html)._

The other day, on a Python forum, someone asked:

> Is there any difference between tuples and lists in terms of performance?

As some of you might already know, I love looking at Python with a critical eye, from a performance perspective. So, I quickly replied:

> A lot : )

And, of course, I explained myself afterward. The response I gave on the forum turned into this post! Here we go. At the low-level implementation, lists have two main bottlenecks:

## Lists take up more memory than needed for their items

In order to quickly insert items into a list, without worrying about the low-level implementation, Python uses a mechanism behind the scenes: when we create a list, Python reserves more memory than is necessary for the items in that list. A list usually occupies about twice the space of its elements in memory. Want to see this in practice? Run this code:

```python
from sys import getsizeof

example = []
for number in range(21):
    example.append(number)
    print(getsizeof(example), example)
```

The result should look something like this:

```
96 [0]
96 [0, 1]
96 [0, 1, 2]
96 [0, 1, 2, 3]
128 [0, 1, 2, 3, 4]
128 [0, 1, 2, 3, 4, 5]
128 [0, 1, 2, 3, 4, 5, 6]
128 [0, 1, 2, 3, 4, 5, 6, 7]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
192 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
264 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
```

The first column shows the amount of memory in bytes the list `example` uses, at each iteration, i.e., as we add new elements to the list. Notice that from 1 to 4 elements, the list occupies 96 bytes. Then it jumps to 128 bytes, and it stays there until it reaches 8 elements. Then another jump: 192 bytes. And it keeps going like that.

This doesn’t happen with tuples. Since they are immutable, Python doesn’t need to reserve extra space for new elements. Don’t believe me? Test it yourself:

```python
for number in range(21):
    example = tuple(range(number))
    print(getsizeof(example), example)
```

The result should look something like this:

```
56 (0,)
64 (0, 1)
72 (0, 1, 2)
80 (0, 1, 2, 3)
88 (0, 1, 2, 3, 4)
96 (0, 1, 2, 3, 4, 5)
104 (0, 1, 2, 3, 4, 5, 6)
112 (0, 1, 2, 3, 4, 5, 6, 7)
120 (0, 1, 2, 3, 4, 5, 6, 7, 8)
128 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
136 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
144 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)
152 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
160 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)
168 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
176 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
184 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
192 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17)
200 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18)
208 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19)
```

This specific way Python implements lists allows us to quickly add new elements to the list most of the time, since the new element fits in that extra space. But what happens when there’s no more room in that extra space? Then comes the other bottleneck:

## Inserting (or removing) elements from a list can be expensive

We saw that the list has extra space that Python reserves for new elements. But as you keep adding elements, you start to use up that space. Similarly, when you remove elements, that extra space becomes unnecessarily large. So, from time to time, Python rewrites the entire list in a different location to adjust that free space. This isn’t done after every `append` or `pop`, but when Python determines that this extra space is disproportionate (either too large or too small).

Rewriting the entire list in a new memory space is a **costly** operation, technologically speaking. Pay attention to this test and its output:

```console
$ python -m timeit -s 'example = [1, 2, 3]' 'example.append(4)'
10000000 loops, best of 3: 0.0585 usec per loop
```

This command does the following: it creates a list `example = [1, 2, 3]` and adds a new item to it (the integer `4`) using `example.append(4)`. This operation is repeated 10 million times, and the output tells me how long this operation takes. Almost nothing: 0.05 microseconds per loop.

Now, instead of just doing one `example.append(4)`, let’s perform a series of 10 `append`s. Since adding one element takes 0.05, the expected time to add 10 elements would be 0.5 (10x more), right? Well, not exactly…

```console
$ python -m timeit -s 'l = [1, 2, 3]' 'for num in range(10): l.append(num)'
1000000 loops, best of 3: 0.888 usec per loop
```

This happens because, from time to time, Python will have to rewrite the entire list somewhere else in memory. This is what happens in the first example when the list jumps from 96 to 128 bytes, then to 192 bytes, and so on. Adding 10 new items to this list, on average, takes about 0.09 microseconds per element — which is almost double the time for a single `append`, right?

This time isn’t distributed equally across each `append`... probably the time to add the first, second, and third items is close to 0.05. But after that, there’s a much slower process of rewriting the entire list, a costly operation. After that, things go back to normal (i.e., quick operations) until another rewrite is necessary.

---

This extra space management in Python lists is brilliant and solves a lot of low-level problems. But there’s a cost, meaning: it occupies more memory than it needs to, and from time to time, list manipulation can be technologically expensive.

That’s why I only use lists when I really need to manipulate (add or remove elements) a sequence. Otherwise, I usually choose a tuple: since a tuple doesn’t need to worry about adding or removing items, it only takes up the necessary memory.
