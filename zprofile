export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.4.1/jars"

export EDITOR="vim"

export PATH=/usr/local/bin:$PATH

# Librato Metrics ENV vars
export METRICS_S3_KEY=AKIAJJ4YRJVJOVMQ6M4Q
export METRICS_S3_SECRET=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

# Librato ENV vars
export METRICS_API_SITE="http://0.0.0.0:9292"
export SL_API_DB="mysql://root@localhost/metrics_development"
export SL_API_TSSTORE_URI="cassandra://127.0.0.1"
export LIBRATO_METRICS_API=1
