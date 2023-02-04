import requests 

url = 'http://192.168.137.242:5000/api/data'

# payload = {'tee': '150'}
# response = requests.post(url, json=payload)

# if response.status_code == 200:
#     print('Data sent successfully')
# else:
#     print('Failed to send data')

r = requests.get(url)
dict = r.json()

print(dict)
