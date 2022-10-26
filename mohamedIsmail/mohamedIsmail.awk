
BEGIN {
        FS =";";
        i = 0;
      }
      {
        car[i] = $1;
        hp[i] = $5;
        country[i] = $9;
        i++;
      }
END   {
     print "Question What are the top 5 cars withthe fastest horsepower and from what country are they from?";
      for (y = 1; y < 6; y++) {
        max = 0; 
        for (x = 2; x < length(hp); x++){
          if (hp[x] > max) {
            max = hp[x];
            carType = car[x];
            origin = country[x];
            indexAt = x;
          }
        }

        print y, ") Car Type: ", carType, " - HorsePower: ",  max, " from ", origin;
        delete hp[indexAt];
      }
      }