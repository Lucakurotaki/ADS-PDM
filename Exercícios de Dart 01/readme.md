<h1>Exercícios de Dart 01</h1>

## 1.

### a.
```dart
void main() {
  int n1;
  int n2;
  
  n1 = 1000;
  n2 = 3;
  
  print(n1%n2);
}

```

### b.
```dart
void main() {
  int n1;
  int n2;
  
  n1 = 1000;
  n2 = 3;
  
  print(n1/n2);
}
```

### c.
```dart
void main() {
  int n1;
  int n2;
  int res;
  
  n1 = 1000;
  n2 = 3;
  res = 1;
  
  for(int i = 0; i < n2; i++){
    res *= n1;
  }
  
  print(res);
}


```
### d.

```dart
void main() {
  int n1;
  int n2;
  
  n1 = 1000;
  n2 = 3;
  
  if(n1 is int){
    print('$n1 é inteiro.');
} else{
    print('$n1 não é inteiro.');
  }
}

```
### e.

```dart
void main() {
  int n1;
  int n2;
  
  n1 = 1000;
  n2 = 3;
  
  if(n1 is! int){
    print('$n1 não é inteiro.');
} else{
    print('$n1 é inteiro.');
  }
}

```

## 2.

```dart
void main(){
  int dia = 19;
  int mes = 2;
  int ano = 2022;
  String dd = '';
  String dm = '';
  
  if(dia < 10){
    dd = '0';
  }
  
  if(mes < 10){
    dm = '0';
  }

  
  String data = "$dd$dia/$dm$mes/$ano";
  
  print(data);
}
```

## 3.

```dart
void main(){
  
  String frase = 'O caractere de escape \\t representa uma "tabulação".';
  
  print(frase);
}
```

## 4.

```dart

```


```dart
```
