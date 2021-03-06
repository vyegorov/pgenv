
prefix = ~/bin
tmp = ~/tmp

#  -----  #
FILES := pgenv pgjob
TARGETS := $(foreach b,$(FILES),$(prefix)/$(b))

all: $(prefix) $(TARGETS) $(tmp)

$(prefix) $(tmp):
	mkdir -p $@
	
# Adding two-phase expansion, otherwise
# $(notdir) is not working as expected here
.SECONDEXPANSION:
$(TARGETS): %: $(CURDIR)/$$(notdir %)
	cp $(CURDIR)/$(notdir $@) $@
