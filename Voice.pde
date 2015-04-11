import ddf.minim.AudioInput;
import ddf.minim.Minim;
import ddf.minim.analysis.FFT;

class Voice
{
  Minim minim;
  AudioInput in;
  float min;
  float max;
  
  int sampleRate = 44100;
  FFT fft;
  
  public void load()
  {
    size(2048, 500);
    smooth();
    minim = new Minim(this);
    
    in = minim.getLineIn(Minim.MONO, width, sampleRate, 16);
    fft = new FFT(width, sampleRate);
    min = Float.MAX_VALUE;
    max = Float.MIN_VALUE;
  }
  
  void update()
  {
    for (int i = 0 ; i < in.bufferSize(); i ++)
    {
      float sample = in.left.get(i);
      
      if (sample < min)
      {
        min = sample;
      }
      
      if (sample > max)
      {
        max = sample;
      }
      sample *= 100.0;
    }
    println(sample);
  }
  
}
