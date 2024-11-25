<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Job;
use App\Entity\Image;
use App\Entity\Candidature;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\FormType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\HttpFoundation\Request;

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
        $image = new Image();
        $image->setUrl('https://cdn.pixabay.com/photo/2015/10/30/10/03/gold-1013618_960_720.jpg ');
        $image->setAlt('job de reves');
        $job->setImage($image);

        //Creation des condidtats
        $candidature1 = new Candidature();
        $candidature2 = new Candidature();

        //Remplir candidat 1
        $candidature1->setCondidat("Rhaiem");
        $candidature1->setContenu("formation J2EE");
        $candidature1->setDate(new \DateTime());

        //Remplir candidat 2
        $candidature2->setCondidat("Salima");
        $candidature2->setContenu("formation Symfony");
        $candidature2->setDate(new \DateTime());

        //affecter un jobAux candidats
        $candidature1->setJob($job);
        $candidature2->setJob($job);


        $entityManager->persist($job->getImage());
        $entityManager->persist($job);
        $entityManager->persist($candidature1);
        $entityManager->persist($candidature2);
        $entityManager->flush();

        return $this->render('job/index.html.twig', [
            'id' => $job->getId(),
        ]);
    }
    #[Route("/job/{id}",name: "job_show")]
    public function show(EntityManagerInterface $entityManager , $id){
        $job = $entityManager->getRepository(job::class)->find($id);

        //Consulter les condidats
        $listCandidatures=$entityManager->getRepository(Candidature::class)->findBy(['job'=>$job]);
        if(!$job){
            throw $this->createNotFoundException('No job found for id'.$id);
        }
        return  $this->render('job/show.html.twig',[
            
        'job' => $job,
        'listCandidatures' => $listCandidatures,
        ]);;
    }
    #[Route("/Ajouter",name:"add_candidat")]
        public function ajouter_cand(Request $request,EntityManagerInterface $em)
        {
            $candidat = new Candidature();
            $fb = $this->createFormBuilder($candidat)
                ->add('condidat',TextType::class)
                ->add('contenu',TextType::class,array("label" => "Contenu"))
                ->add('date',DateType::class)
                ->add('job',EntityType::class,['class' => Job::class,
                'choice_label' => 'type',
                ])
                ->add('valider',SubmitType::class);
            $form = $fb->getForm();
            //Injection dans la base de donnée
            $form->handleRequest($request);
            
            if ($form->isSubmitted()) { 
                $em->persist($candidat);
                $em->flush();
                return $this->redirectToRoute('Acceuil');
                
            }
            return $this->render('job/ajouter.html.twig',
            ['f' => $form->createView()]);
        }
}



