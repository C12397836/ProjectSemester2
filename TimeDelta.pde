class TimeDelta
{
  int m;
  int second;

  public TimeDelta()
  {
    m=0;
    second=0;
  }
  void update()
  {
    m=millis();
    second= m /1000;
  }
}

