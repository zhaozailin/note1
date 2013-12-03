// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.zzl.mynote.domain;

import com.zzl.mynote.domain.ArticleTypeDataOnDemand;
import com.zzl.mynote.domain.ArticleType;
import com.zzl.mynote.domain.ArticleTypeIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ArticleTypeIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ArticleTypeIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ArticleTypeIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ArticleTypeIntegrationTest: @Transactional;
    
    @Autowired
    ArticleTypeDataOnDemand ArticleTypeIntegrationTest.dod;
    
    @Test
    public void ArticleTypeIntegrationTest.testCountArticleTypes() {
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", dod.getRandomArticleType());
        long count = ArticleType.countArticleTypes();
        Assert.assertTrue("Counter for 'ArticleType' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ArticleTypeIntegrationTest.testFindArticleType() {
        ArticleType obj = dod.getRandomArticleType();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to provide an identifier", id);
        obj = ArticleType.findArticleType(id);
        Assert.assertNotNull("Find method for 'ArticleType' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ArticleType' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ArticleTypeIntegrationTest.testFindAllArticleTypes() {
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", dod.getRandomArticleType());
        long count = ArticleType.countArticleTypes();
        Assert.assertTrue("Too expensive to perform a find all test for 'ArticleType', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ArticleType> result = ArticleType.findAllArticleTypes();
        Assert.assertNotNull("Find all method for 'ArticleType' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ArticleType' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ArticleTypeIntegrationTest.testFindArticleTypeEntries() {
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", dod.getRandomArticleType());
        long count = ArticleType.countArticleTypes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ArticleType> result = ArticleType.findArticleTypeEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ArticleType' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ArticleType' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ArticleTypeIntegrationTest.testFlush() {
        ArticleType obj = dod.getRandomArticleType();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to provide an identifier", id);
        obj = ArticleType.findArticleType(id);
        Assert.assertNotNull("Find method for 'ArticleType' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyArticleType(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ArticleType' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ArticleTypeIntegrationTest.testMergeUpdate() {
        ArticleType obj = dod.getRandomArticleType();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to provide an identifier", id);
        obj = ArticleType.findArticleType(id);
        boolean modified =  dod.modifyArticleType(obj);
        Integer currentVersion = obj.getVersion();
        ArticleType merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ArticleType' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ArticleTypeIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", dod.getRandomArticleType());
        ArticleType obj = dod.getNewTransientArticleType(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ArticleType' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'ArticleType' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ArticleTypeIntegrationTest.testRemove() {
        ArticleType obj = dod.getRandomArticleType();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ArticleType' failed to provide an identifier", id);
        obj = ArticleType.findArticleType(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ArticleType' with identifier '" + id + "'", ArticleType.findArticleType(id));
    }
    
}