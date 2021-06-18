import unittest
import pandas as pd

class TestGetNumber(unittest.TestCase):

  def test_pandas_usage(self):
    dates = pd.date_range("20130101", periods=6)

if __name__ == '__main__':
  unittest.main()
