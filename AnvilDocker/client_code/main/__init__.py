from ._anvil_designer import mainTemplate
from anvil import *
import anvil.server
import time

class main(mainTemplate):
  def __init__(self, **properties):
    self.init_components(**properties)
    self.test = {}
    self.test_running = False

    # Any code you write here will run when the form opens.

  def get_host_click(self, **event_args):
    self.host_name.text = anvil.server.call('get_host')

  def stress_btn_click(self, **event_args):
    if self.stress_btn.background == '':
      self.test = {}
      self.stress_btn.background = 'red'
      self.stress_btn.foreground = 'white'
      self.test_running = True
      self.test_timer.interval = self.delay.text
    else:
      self.test_timer.interval = 0
      self.stress_btn.background = ''
      self.stress_btn.foreground = ''
      self.test_running = False
      

  def update_panel(self, **kw):
    res = []
    for host, count in self.test.items():
      res.append({"host":host, "count": count})
    self.test_panel.items = res

  def test_timer_tick(self, **event_args):
    with anvil.server.no_loading_indicator:
      host = anvil.server.call('get_host')
    if not self.test.get(host, None): self.test[host] = 0
    self.test[host] += 1
    self.update_panel()
      
      

