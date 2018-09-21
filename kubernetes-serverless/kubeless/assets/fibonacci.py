import json

def fibonacci(n):
  if n == 0:
    return 0
  elif n == 1:
    return 1
  else:
    return fibonacci(n-1) + fibonacci(n-2)

def sequence(length):
  row = [fibonacci(n) for n in range(1,length)]
  result = ','.join( str(x) for x in row )
  print("Fibonacci sequence: " + result)
  return {"sequence":result}

def values(request):
  print request.json
  length = request.json["length"]
  return sequence(length)
  
#print(sequence(18))