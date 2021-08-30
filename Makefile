eb-setup:
	git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git &&\
		./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer &&\
		 echo 'export PATH=/home/ec2-user/.pyenv/versions/3.7.2/bin:$PATH' >> /home/ec2-user/.bash_profile && source /home/ec2-user/.bash_profile &&
		 rm -rf aws-elastic-beanstalk-cli-setup
		
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv test_application.py

lint:
	pylint --disable=R,C application.py

deploy:
	echo "Deploying app"
	eb deploy hello-env

all: install lint test 