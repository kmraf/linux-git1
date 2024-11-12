#! usr/bin/awk
BEGIN{
  cols = "doc_id,hotel_name,hotel_url,street,city,state,country,zip,class,price,num_reviews,CLEANLINESS,ROOM,SERVICE,LOCATION,VALUE,COMFORT,overall_ratingsource"
  FS=","
  s=0
  cnt=0
}

$18!=-1{
  s += $18
  cnt += 1
}

END{
  print "RATING_AVG", s / cnt
}
