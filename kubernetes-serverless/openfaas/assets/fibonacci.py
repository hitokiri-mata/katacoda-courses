def fibonacci(n):
    if n == 0:
      return 0
    elif n == 1:
      return 1
    else:
      return fibonacci(n-1) + fibonacci(n-2)

def sequence(length):
    row = [fibonacci(n) for n in range(1,length+1)]
    result = ','.join( str(x) for x in row )
    return {"sequence":result}

def values(event, context):
    length = event['data']['length']
    return sequence(int(length))

# OpenFaaS expects this method signature
def handle(req):
    return sequence(req)