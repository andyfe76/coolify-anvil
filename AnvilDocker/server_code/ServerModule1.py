import anvil.server
import platform

@anvil.server.callable
def get_host():
  host = platform.node()
  print(host)
  return host