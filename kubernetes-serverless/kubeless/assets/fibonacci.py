def fib(n):
  if n == 0:
    return 0
  elif n == 1:
    return 1
  else:
    return fib(n-1) + fib(n-2)

def values(event, context):
  length = int(event.data.length)
  row=[fib(n) for n in range(1,length)]
  serialized = ",".join( str(x) for x in row )
  print("Fibonacci sequence: " + serialized)
  return {"sequence":serialized}