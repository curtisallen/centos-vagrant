NAME=flanneld-amd64
VERSION=0.7.0
MAJOR_VERSION=0.7
ARCHITECTURE=x86_64
TARDIR=$(NAME)-$(VERSION)
DOWNLOAD=https://github.com/coreos/flannel/releases/download/v$(VERSION)/$(NAME)

PACKAGE_NAME=flanneld
PREFIX=/opt


.PHONY: default
default: rpm
package: rpm

.PHONY: clean
clean:
	rm -f $(NAME)-* $(NAME)_* |NAME| true
	rm -fr $(TARDIR) || true
	rm -fr $(NAME) || true
	rm -f $(PACKAGE_NAME) || true
	rm -f *.rpm

$(PACKAGE_NAME):
	wget -O $(PACKAGE_NAME) "$(DOWNLOAD)"

$(TARDIR): $(PACKAGE_NAME)
	mkdir -p $(TARDIR) $(TARDIR)$(PREFIX)/
	chmod +x $(PACKAGE_NAME)
	cp $(PACKAGE_NAME) $(TARDIR)$(PREFIX)/
	cp -r etc $(TARDIR)/
	cp -r lib $(TARDIR)/

.PHONY: rpm
rpm: $(TARDIR)
	fpm -s dir \
		-t rpm \
		-a all \
		-v $(VERSION) \
		-n $(PACKAGE_NAME) \
		-a $(ARCHITECTURE) \
		-C $(TARDIR) \
		.
