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
void main(){
  double salAtual = 3000.5;
  
  double salUm = salAtual + (salAtual*0.07);
  
  double salDois = salUm + (salUm*0.06);
  
  double salTres = salDois + (salDois*0.05);
  
  String lista = """
  Salário Atual: $salAtual
  Um ano depois: $salUm
  Dois anos depois: $salDois
  Três anos depois: $salTres
  """;
  
  print(lista);
}
```

## 5.
<p>12</p>

## 6.

```dart
void main(){
  double grade1 = 7.5;
  double grade2 = 4.2;
  double grade3 = 8;
  
  double finalGrade = (grade1+grade2+grade3)/3;
  
  String situation = '';
  
  if(finalGrade < 4){
    situation = 'Reprovado.';
  }else if(finalGrade < 7){
    situation = 'Exame final.';
  }else{
    situation = 'Aprovado.';
  }
  
  print("Média: $finalGrade. Situação: $situation");
}
```

## 7.

```dart
void main(){
  int limite = 10;
  
  String ponto = '';
  
  for(int i = 1; i<=limite; i++){
    ponto += '.';
    print('$ponto$i');
  }
}
```

## 8.

```dart
void main(){
  var sequencia = [3,12,1,88,15,64];
  
  sequencia.forEach((item) => print(item*2));
}
```
