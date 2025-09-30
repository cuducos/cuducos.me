---
layout: post
lang: en
title: "Python Generators: What They Are and What Problems They Solve"
---

_Originally published in [Brazilian Portuguese]({% post_url 2017-08-11-geradores-do-python-o-que-sao-e-quais-problemas-resolvem %})._

The other day, a friend saw me writing a *function* in Python that used `yield` instead of `return`, and asked:

> — What's the point of that? I’ve never really got it…

Actually, I was writing a *generator*, not a *function*. The syntax is basically the same, and the only difference, as my friend noticed, is that it uses `yield` instead of `return`. But so what? What’s it for?

A function returns a value and that’s it — its lovely existence in the world ends right there. A generator, on the other hand, gives you a value and waits for you to ask for the next one.

For example, I could have a function that returns a list of numbers like `[1, 2, 3]`, and then I’d figure out what to do with them. A generator gives me `1` and waits for me to ask, *"Okay generator, what’s next?"* Then it gives me `2`, and so on.

But hey, better than explaining is showing a practical example: imagine a function that returns all integers between `0` and `max_number` (sure, you could just use `range`, but… bear with me):

```python
def numbers_up_to(max_number):
    output = []

    for number in range(max_number + 1):
        output.append(number)

    return output
```

The way it’s written here, the function builds a list `[0, 1, 2, 3, 4, …]` all the way up to `max_number`. It creates that list right away, holds it all in memory. That takes up space and uses hardware resources. Which is totally fine if `max_number` is small…

…but try using that function with a mole, that big number for chemistry classes (i.e., `numbers_up_to(623 * 10 ** 21)`). No, don’t actually try it. Your computer will have a meltdown. Seriously.

That’s where a more efficient alternative comes in: generators! Let’s turn that *function* into a *generator*. It’s simple — we don’t build any list, and we use `yield` instead of `return`:

```python
def numbers_up_to(max_number):
    for number in range(max_number + 1):
        yield number
```

Now try using that function with a huge number: `numbers_up_to(623 * 10 ** 21)`. Go for it. You can actually try it this time — your computer won’t lose it.

It’ll only calculate the first element in the sequence when it’s needed. It'll give you `1` and then stop. No extra processing, no memory allocation. Nothing. Until you ask for the next number. Then it forgets the first and gives you the second. And on it goes. You ask, it delivers — the third, the fourth, the fifth, and so on. One at a time.

Instead of building the whole list, it builds a generator (for lists, or anything iterable), and computes each item only when you access it… it only does the work at each call to `next()` — which is actually what’s called behind the scenes when you use a `for` loop with a generator.

But `next()` can also be used manually — great for experimenting:

```python
my_first_generator = numbers_up_to(42)
next(my_first_generator)
next(my_first_generator)
next(my_first_generator)
next(my_first_generator)
next(my_first_generator)
```

---

In fact, in my examples, `range` — which is built into Python 3 — is already a generator.

Generators are super useful and very gentle on memory. But of course, nothing's perfect. They do come with a few limitations: for example, you can’t use two `for` loops directly on the same generator — generators move forward only, they never rewind. So once the first `for` loop runs through it, the second one won’t have anything left to work with.

--- 

A short and simple text, adapted from the quick explanation I gave my friend. He said: *“Great explanation — now I get it.”* So hopefully it helps someone else too. ;)
