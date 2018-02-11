package com.devwithimagination.jcache.cdi;

import java.util.Properties;
import javax.cache.CacheManager;
import javax.cache.Caching;
import javax.cache.spi.CachingProvider;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Alternative;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;

@ApplicationScoped
@Alternative
/**
 * Producer for creating CacheManager instances.
 */
public class CacheManagerProducer {

	@Produces
    public CacheManager create() {

        final CachingProvider cachingProvider = Caching.getCachingProvider();
        
        final CacheManager cacheManager = cachingProvider.getCacheManager(
                    cachingProvider.getDefaultURI(),
                    cachingProvider.getDefaultClassLoader(),
                    new Properties());

        System.out.println("Returning instance with hash code " + cacheManager.hashCode());

        return cacheManager;
    }

    public void close(@Disposes CacheManager cacheManager) {
        cacheManager.close();
    }

}