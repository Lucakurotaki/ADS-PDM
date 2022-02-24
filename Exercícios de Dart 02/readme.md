<h1>Exercícios de Dart 01</h1>

## 1.

```dart
int somaItens(List<int> colecao){
    int resultado = 0;
    for(int i = 0; i < colecao.length; i++){
      resultado += colecao[i];
    }
    
    return resultado;
}


void main(){
  List<int> colecao = [1, 10, 100, 1000,10000];
  
  print(somaItens(colecao));
}
```

## 2.
```dart
int multiplicaItens(List<int> colecao){
    int resultado = 1;
    for(int i = 0; i < colecao.length; i++){
      resultado *= colecao[i];
    }
    
    return resultado;
}


void main(){
  List<int> colecao = [1, 10, 100, 1000,10000];
  
  print(multiplicaItens(colecao));
}
```

## 3.
```dart
int somaItens(List<int> colecao){
    int resultado = 0;
    for(int i = 0; i < colecao.length; i++){
      resultado += colecao[i];
    }
    
    return resultado;
}

int multiplicaItens(List<int> colecao){
    int resultado = 1;
    for(int i = 0; i < colecao.length; i++){
      resultado *= colecao[i];
    }
    
    return resultado;
}

int comando(List<int> colecao, int Function(List<int>) operacao){
  return operacao(colecao);
}


void main(){
  List<int> colecao = [1, 10, 100, 1000,10000];
  
  print('Soma:');
  print(comando(colecao, somaItens));
  
  print('Produto:');
  print(comando(colecao, multiplicaItens));
}
```

## 4.
```dart
int expTrad (int base, int expo){
  int resultado = 1;
  
  for(int i = 0; i < expo; i++){
    resultado *= base;
  }
  
  return resultado;
}

var expSeta = (int b, int e, {int r = 1}) => {for(int i=0; i<e; i++){r*=b}, r};

void main(){
  print('Tradicional:');
  print(expTrad(2,3));
  
  print('Arrow:');
  print(expSeta(2,3));
}
```

## 5.

<p>Link do vídeo:</p>
<p>https://drive.google.com/file/d/1NXsxp0Z6FmIhdE9tv2wG4iGeFN_lrL5z/view?usp=sharing</p>

