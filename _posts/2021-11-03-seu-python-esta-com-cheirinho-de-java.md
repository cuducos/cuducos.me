---
layout: post
title: "Seu Python está com cheirinho de Java"
---

_Post de [autoria de Mohammad Tayseer publicado originalmente em inglês](https://web.archive.org/web/20201111210612/http://mtayseer.net/2014/11/06/your-python-smells-like-java/). Tradução livre de Eduardo Cuducos._

Goste ou não, você já usa diferentes linguagens de programação a cada dia: SQL, JavaScript, Python, C++ e outras. Diz o ditado que ao aprender uma nova linguagem de programação, você aprende a programar melhor, mas muitas pessoas não ganham esse benefício e sentem que isso é uma perda de tempo. Depois de conversar e trabalhar como pessoas assim por muitos anos, eu percebi que elas aprendem a sintaxe da linguagem de programação, talvez algumas bibliotecas, mas elas não pegam o espírito da linguagem.

Por exemplo:

```python
# Ruim: você precisa ler até o final para entender a intenção do código
img.find('.jpg') != -1
img.find('.jpg') >= 0

# Mais legível
'.jpg' in img
'.jpg' not in img
```

```python
# Ruim: número mágico
img[-4:] == '.jpg'

# Bom: funciona com textos de qualquer tamanho
img.endswith('.jpg')
```

```python
# Ruim
(img.endswith('.jpg') or img.endswith('.jpeg') or img.endswith('.png') or 
    img.endswith('.gif')

# Bom: usa capacidades nativas do Python para fazer o código mais compacto
img.endswith((".jpg", ".jpeg", ".png", ".gif"))
```

```python
# Ruim
path == 'js' or path == 'css' or path == 'img' or path == 'font' or path == 'fonts'

# Bom: código mais compacto
path in ('js', 'css', 'img', 'font', 'fonts')
```

```python
# Ruim
(os.path.exists(os.path.join(path, "space")) or 
    os.path.exists(os.path.join(path, "bucket")) or 
    os.path.exists(os.path.join(path, "actor"))

# Bom: código compatco, mais legível, e a lista pode ser movida para um outro arquivo
any(os.path.exists(os.path.join(path, item)) for item in ["space", "bucket", "actor"])
```

```python
# Ruim
for i in range(len(lst)):
    elt = lst[i]
    print i, elt

# Bom: usa funções nativas do Python
for i, elt in enumerate(lst):
    print i, elt
```

```python
# Ruim
print 'Hello ', name, '. You are ', age, ' years old'

# Bom: reflete a estrutura que a saída espera
print 'Hello {name}. You are {age} years old'.format(name=name, age=age)
```

```python
# Ruim
if not (key in dict):
    print 'Key missing'

# Bom: mais legível
if key not in dict:
    print 'Key missing'
```

```python
# Ruim
s = names[0]
for name in names[1:]:
    s += ', ' + name

# Bom: evita erros por um passo
s = ', '.join(names)
```

```python
# Ruim: descobrir se o array1 é um subconjunto do array2
is_subset = True
for x in array1:
    found = False
    for y in array2:
        if x == y:
            found = True
            break

    if not found:
        is_subset = False
        break

# Bom: 2 linhas ao invés de 10
def subset_of(array1, array2):
    return set(array1).issubset(array2)
```

```python
# Ruim 
if case_sensitivity.lower() == 'sensitive':
    matcher = fnmatch.fnmatchcase
elif case_sensitivity.lower() == 'insensitive':
    def matcher(fname, pattern):
        return fnmatch.fnmatchcase(fname.lower(), pattern.lower())
else:
    matcher = fnmatch.fnmatch

# Bom: a busca pro padr∫o pode ser movida para outro arquivo
matchers = {
    'sensitive': fnmatch.fnmatchcase
    'insensitive': lambda fname, pattern: fnmatch.fnmatchcase(fname.lower(), pattern.lower())
}.get(case_sensitivity.lower(), fnmatch.fnmatch)
```
