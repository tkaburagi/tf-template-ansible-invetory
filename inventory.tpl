[webservers]
%{ for index, ip in web-ip ~}
${web-ip[index]}
%{ endfor ~}

[dbservers]
%{ for index, ip in db-ip ~}
${db-ip[index]}
%{ endfor ~}