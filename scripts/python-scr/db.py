import docker
dclient = docker.from_env()
from sys import argv
def mysql_up():
    mysql_db_container = dclient.containers.run("mysql:latest",
                                                command="--default-authentication-plugin=mysql_native_password",
                                                auto_remove=True,
                                                detach=True,
                                                name='docker_Mysql',
                                                volumes={'/home/contre/'+ 'db/mysql_data': {'bind': '/var/lib/mysql'}},
                                                ports={'3306': '3308'},
                                                environment=[
                                                    f"MYSQL_DATABASE={argv[1]}",
                                                    f"MYSQL_USER={argv[2]}",
                                                    f"MYSQL_PASSWORD={argv[3]}",
                                                    f"MYSQL_ROOT_PASSWORD=toor",
                                                ]
                                                )
    print(mysql_db_container.logs())


mysql_up()
