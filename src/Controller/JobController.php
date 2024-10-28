<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Job;

class JobController extends AbstractController
{
    #[Route('/job', name: 'app_job')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $job = new Job();
        $job->setType('Développeur');
        $job->setCompany('vetter');
        $job->setDescription('python');
        $job->setExpireAt(new \DateTimeImmutable());
        $job->setEmail('vetter@gmail.com');
        $entityManager->persist($job);
        $entityManager->flush();

        return $this->render('job/index.html.twig', [
            'id' => $job->getId(),
        ]);
    }
    #[Route("/job/{id}",name: "job_show")]
    public function show(EntityManagerInterface $entityManager , $id){
        $job = $entityManager->getRepository(job::class)->find($id);
        return  $this->render('job/show.html.twig',[
            
        'job' => $job]);;
    }
}
