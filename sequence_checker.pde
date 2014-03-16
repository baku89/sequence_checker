// parameters
String prefix = "~/sequence/frame.";
String suffix = ".tiff";

int digits  = 5; // keta

// sequence range
int start   = 1;
int end     = 334;

// variables


void setup()
{
  File f;
  String name;
  boolean isOK = true;
  int ms = -1;
  boolean mp = false;
  int i;
  
  // check
  for(i = start; i <= end; i++) {
    f = new File(prefix + nf(i, digits) + suffix);
    
    if (!f.exists()) {
      if (!mp)
        ms = i;
      
      mp = true;
      isOK = false;
    } else {
      if (mp) {
        if (ms == i-1)
          println(nf(i-1, digits));
        else
          println(nf(ms, digits) + "-" + nf(i-1, digits));
      }
      mp = false;
    }
  }
  
  if (mp) {
    if (ms == --i)
      println(nf(i, digits));
    else
      println(nf(ms, digits) + "-" + nf(i, digits));
  }
  
  println("----------");
  
  if (isOK) {
    println("all good");
  } else {
    println("missing frame found");
  }
  
}
