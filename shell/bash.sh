# scp with key
scp -i ~/.ssh/mytest.key root@<IPADDR>:/<filepath on host>  <path on client>

# save python packages 
python -m pip freeze > requirements.txt
