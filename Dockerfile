FROM  ghcr.io/qlicks/magento-php-7.4:latest



RUN composer global require --dev php-parallel-lint/php-parallel-lint && composer global require --dev phpro/grumphp && \
    composer global require --dev "squizlabs/php_codesniffer=*" && \
    composer global require --dev magento/magento-coding-standard && \
    /app-home/.composer/vendor/bin/phpcs --config-set installed_paths /app-home/.composer/vendor/phpcompatibility/php-compatibility,/app-home/.composer/vendor/magento/magento-coding-standard/
    
     
#Disabled
#    composer2 global require --dev friendsofphp/php-cs-fixer:v3.4.0 && \
#    composer2 global require --dev phpstan/phpstan && \
#    composer2 global require --dev phpmd/phpmd && \


COPY entrypoint.sh /entrypoint.sh
COPY grumphp.yml  /grumphp.yml
ENV PATH "$HOME/.composer/vendor/bin:$PATH"

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

