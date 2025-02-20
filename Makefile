.PHONY=	test

version:
	@echo ${VERSION}

build-library:
	@./gradlew :blessed:build -PlibraryVersion=${VERSION} -PmavenUser=${MAVEN_USER} -PmavenToken=${MAVEN_TOKEN}

publish-android:
	@./gradlew :blessed:publish -PlibraryVersion=${VERSION} -PmavenUser=${MAVEN_USER} -PmavenToken=${MAVEN_TOKEN}

delete-tag:
	@git tag --delete $(tag) && git push origin :refs/tags/$(tag)

tag-version:
	@git tag ${VERSION} && \
	git push --tags

tag:
	@git tag $(value) && \
	git push --tags