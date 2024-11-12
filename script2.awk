#! usr/bin/awk
BEGIN{
  name = "CLEANLINESS"
}

/Hilton/{
  if($18!=-1){
    cntry = tolower($7)
    hil_sum[cntry] += $12
    hil_nums[cntry] += 1
  }
}

/Holiday/{
  if($18!=-1){
    cntry = tolower($7)
    hol_sum[cntry] += $12
    hol_nums[cntry] += 1
  }
}


END{
  for(cntry in hol_sum){
    print name, cntry, hol_sum[cntry] / hol_nums[cntry], hil_sum[cntry] / hil_nums[cntry]
  }

}
