#! /bin/bash

cd /java || exit

javadoc_output=$(javadoc -d /tmp/javadoc -encoding utf8 -docencoding utf8 -charset utf8 -quiet -windowtitle "$PROJECT_NAME" "$JAVA_PACKAGE" 2>&1)

echo javadoc_output

if echo "$javadoc_output" | grep -q -E "error:"; then
  echo "Errors detected in Javadoc generation for $PROJECT_NAME. Sending email..."
  # Add your email sending logic here for errors.
elif echo "$javadoc_output" | grep -q -E "warning:"; then
  echo "Warnings detected in Javadoc generation for $PROJECT_NAME. Sending email and moving generated doc..."
  # Add your email sending logic here for warnings.
  mv -r /tmp/javadoc/* /generated
else
  echo "Javadoc generation for $PROJECT_NAME completed successfully. Moving generated doc..."
  mv -r /tmp/javadoc/* /generated
fi
tail -f /dev/null
